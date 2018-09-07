defmodule Basics.Membership.User do
  @moduledoc """
  Represents a member
  """
  use Ecto.Schema
  alias Basics.Membership.Profile

  schema "users" do
    field(:username, :string)
    has_one(:profile, Profile)

    timestamps()
  end
end
