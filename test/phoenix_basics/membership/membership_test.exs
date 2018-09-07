defmodule Basics.MembershipTest do
  use Basics.DataCase

  alias Basics.Membership
  alias Basics.Membership.Profile
  alias Basics.Membership.User
  alias Basics.Repo
  alias Basics.Signup
  alias Ecto.Changeset

  @valid_attrs %{password: "some password", username: "some username"}

  describe "Given a user exists in the database" do
    setup do
      {:ok, user} = Signup.create_user(@valid_attrs)

      [user: user]
    end

    test "authenticate_user/1 returns a user if found", %{user: user} do
      result = Membership.get_user(user.id)

      assert %User{} = result
      assert result.id == user.id
      assert result.profile == nil
    end

    test "authenticate_user/1 returns nil if not found", %{user: user} do
      result = Membership.get_user(user.id + 1)

      assert is_nil(result)
    end
  end

  describe "given a user without a profile" do
    setup do
      {:ok, user} = Signup.create_user(@valid_attrs)

      [user: Membership.get_user(user.id)]
    end

    test "change_profile/1 returns a profile changeset", %{user: user} do
      assert is_nil(user.profile)
      assert %Changeset{} = Membership.change_profile(user)

      updated_user = Membership.get_user(user.id)
      assert %Profile{} = updated_user.profile
      assert "user_#{user.id}" == updated_user.profile.slug
      assert user.id == updated_user.profile.user_id
    end
  end

  describe "given a user with a profile" do
    @update_attrs %{
      company: "Pattern Toaster",
      description: "I'm an Elixir Developer who loves BBQ",
      first: "Brian",
      github: "mcelaney",
      last: "McElaney",
      slug: "mac2",
      title: "Director, Product Development",
      twitter: "mcelaney",
      image: %Plug.Upload{
        content_type: "image/jpeg",
        filename: "BrianMcElaney.jpg",
        path: Path.join(:code.priv_dir(:phoenix_basics), "/repo/seeds/images/BrianMcElaney.jpg")
      }
    }

    @invalid_attrs %{slug: nil}

    setup do
      user = %User{profile: %Profile{slug: "mac"}} |> Repo.insert!()

      [user: Membership.get_user(user.id)]
    end

    test "change_profile/1 returns a profile changeset", %{user: user} do
      assert user.profile.slug == "mac"
      assert %Changeset{} = Membership.change_profile(user)

      updated_user = Membership.get_user(user.id)
      assert %Profile{} = updated_user.profile
      assert updated_user.profile.slug == "mac"
    end

    test "update_profile/2 with valid_params", %{user: user} do
      Membership.update_profile(user, @update_attrs)
      user = Membership.get_user(user.id)
      assert user.profile.company == "Pattern Toaster"
      assert user.profile.description == "I'm an Elixir Developer who loves BBQ"
      assert user.profile.first == "Brian"
      assert user.profile.github == "mcelaney"
      assert user.profile.image[:file_name] == "BrianMcElaney.jpg"
      assert user.profile.last == "McElaney"
      assert user.profile.slug == "mac2"
      assert user.profile.title == "Director, Product Development"
      assert user.profile.twitter == "mcelaney"
    end

    test "update_profile/2 with invalid_params", %{user: user} do
      result = Membership.update_profile(user, @invalid_attrs)
      assert {:error, %Changeset{valid?: false, action: :update}} = result
    end

    test "get_user/1 with an existing profile_id", %{user: user} do
      result = Membership.get_profile!(user.profile.id)
      assert result.slug == "mac"
    end

    test "get_user/1 with an non_existing profile_id", %{user: user} do
      assert_raise Ecto.NoResultsError, fn ->
        Membership.get_profile!(user.profile.id + 1)
      end
    end

    test "get_user/1 with an existing profile slug", %{user: user} do
      result = Membership.get_profile!("mac")
      assert result.id == user.profile.id
    end

    test "get_user/1 with an non_existing profile slug" do
      assert_raise Ecto.NoResultsError, fn ->
        Membership.get_profile!("burt_reynolds")
      end
    end
  end
end
