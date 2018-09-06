defmodule Basics.AuthTest do
  use Basics.DataCase

  alias Basics.Auth
  alias Basics.Signup
  alias Ecto.Changeset

  @valid_attrs %{password: "some password", username: "some username"}

  describe "Given a user exists in the database" do
    alias Basics.Auth.User

    setup do
      {:ok, user} = Signup.create_user(@valid_attrs)

      [user: user]
    end

    test "authenticate_user/1 returns an :ok tuple on success", %{user: user} do
      {:ok, result} = Auth.authenticate_user(@valid_attrs)

      assert %User{} = result
      assert result.id == user.id
    end

    test "authenticate_user/1 returns an :error tuple if user not found" do
      invalid = Map.put(@valid_attrs, :username, "Some other user")
      {:error, %Changeset{} = change} = Auth.authenticate_user(invalid)

      assert is_nil(change.action)
    end

    test "authenticate_user/1 returns an :error tuple if password incorrect" do
      invalid = Map.put(@valid_attrs, :password, "Some other password")
      {:error, %Changeset{} = change} = Auth.authenticate_user(invalid)

      assert is_nil(change.action)
    end

    test "change_user/1 returns a user changeset" do
      assert %Changeset{} = Auth.change_user(%User{})
    end
  end
end
