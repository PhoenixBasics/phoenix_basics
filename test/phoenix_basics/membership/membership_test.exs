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
end
