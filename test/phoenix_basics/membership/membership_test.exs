defmodule Basics.MembershipTest do
  use Basics.DataCase

  alias Basics.Membership
  alias Basics.Signup

  @valid_attrs %{password: "some password", username: "some username"}

  describe "Given a user exists in the database" do
    alias Basics.Membership.User

    setup do
      {:ok, user} = Signup.create_user(@valid_attrs)

      [user: user]
    end

    test "authenticate_user/1 returns a user if found", %{user: user} do
      result = Membership.get_user(user.id)

      assert %User{} = result
      assert result.id == user.id
    end

    test "authenticate_user/1 returns nil if not found", %{user: user} do
      result = Membership.get_user(user.id + 1)

      assert is_nil(result)
    end
  end

  describe "profiles" do
    alias Basics.Membership.Profile

    @valid_attrs %{
      company: "some company",
      description: "some description",
      first: "some first",
      github: "some github",
      image: "some image",
      last: "some last",
      slug: "some slug",
      title: "some title",
      twitter: "some twitter"
    }
    @update_attrs %{
      company: "some updated company",
      description: "some updated description",
      first: "some updated first",
      github: "some updated github",
      image: "some updated image",
      last: "some updated last",
      slug: "some updated slug",
      title: "some updated title",
      twitter: "some updated twitter"
    }
    @invalid_attrs %{
      company: nil,
      description: nil,
      first: nil,
      github: nil,
      image: nil,
      last: nil,
      slug: nil,
      title: nil,
      twitter: nil
    }

    def profile_fixture(attrs \\ %{}) do
      {:ok, profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Membership.create_profile()

      profile
    end

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Membership.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Membership.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      assert {:ok, %Profile{} = profile} = Membership.create_profile(@valid_attrs)
      assert profile.company == "some company"
      assert profile.description == "some description"
      assert profile.first == "some first"
      assert profile.github == "some github"
      assert profile.image == "some image"
      assert profile.last == "some last"
      assert profile.slug == "some slug"
      assert profile.title == "some title"
      assert profile.twitter == "some twitter"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Membership.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      assert {:ok, profile} = Membership.update_profile(profile, @update_attrs)
      assert %Profile{} = profile
      assert profile.company == "some updated company"
      assert profile.description == "some updated description"
      assert profile.first == "some updated first"
      assert profile.github == "some updated github"
      assert profile.image == "some updated image"
      assert profile.last == "some updated last"
      assert profile.slug == "some updated slug"
      assert profile.title == "some updated title"
      assert profile.twitter == "some updated twitter"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Membership.update_profile(profile, @invalid_attrs)
      assert profile == Membership.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Membership.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Membership.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Membership.change_profile(profile)
    end
  end
end
