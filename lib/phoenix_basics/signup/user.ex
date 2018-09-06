defmodule Basics.Signup.User do
  @moduledoc """
  Represents an user in transition from an anonymous statge to a member state.
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt

  @bad_passwords ~w(
    12345678
    password1
    qwertyuiop
  )

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
    |> validate_exclusion(
      :password,
      @bad_passwords,
      message: "That password is too common."
    )
    |> validate_length(:password, min: 8)
    |> unique_constraint(:username)
    |> put_pass_hash()
  end

  @doc """
  Helper function to expose blacklisted passwords to tests
  """
  def blacklisted_passwords, do: @bad_passwords

  defp put_pass_hash(%{valid?: true, changes: params} = changeset) do
    password = Bcrypt.hashpwsalt(params[:password])
    change(changeset, password: password)
  end

  defp put_pass_hash(changeset) do
    change(changeset, password: "")
  end
end
