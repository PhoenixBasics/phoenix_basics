defmodule Basics.Signup.User do
  @moduledoc """
  Represents an user in transition from an anonymous statge to a member state.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:password, :string)
    field(:username, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
  end
end
