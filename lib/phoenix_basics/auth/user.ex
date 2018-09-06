defmodule Basics.Auth.User do
  @moduledoc """
  Represents an user in transition from an anonymous state to an authenticated
  state.
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
  end
end
