defmodule Basics.AuthTest do
  use Basics.DataCase

  alias Basics.Auth

  describe "users" do
    alias Basics.Auth.User

    test "change_user/1 returns a user changeset" do
      assert %Ecto.Changeset{} = Auth.change_user(%User{})
    end
  end
end
