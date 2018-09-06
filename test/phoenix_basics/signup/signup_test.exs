defmodule Basics.SignupTest do
  use Basics.DataCase
  alias Basics.Signup

  describe "users" do
    alias Basics.Signup.User

    @valid_attrs %{password: "some password", username: "some username"}
    @invalid_attrs %{password: nil, username: nil}

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Signup.create_user(@valid_attrs)
      assert user.password != "some password" and not is_nil(user.password)

      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Signup.create_user(@invalid_attrs)
    end

    test "create_user/1 requires a long password" do
      invalid = Map.put(@valid_attrs, :password, "1234567")

      assert {:error, %Ecto.Changeset{}} = Signup.create_user(invalid)
    end

    test "create_user/1 rejects blacklist passwords" do
      [reject_password | _] = User.blacklisted_passwords()
      invalid = Map.put(@valid_attrs, :password, reject_password)

      assert {:error, %Ecto.Changeset{}} = Signup.create_user(invalid)
    end

    test "change_user/1 returns a user changeset" do
      assert %Ecto.Changeset{} = Signup.change_user(%User{})
    end
  end
end
