defmodule Basics.Membership.User do
  @moduledoc """
  Represents a member
  """
  use Ecto.Schema

  schema "users" do
    field(:username, :string)

    timestamps()
  end
end
