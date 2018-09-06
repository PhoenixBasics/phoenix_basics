defmodule Basics.Membership.Profile do
  @moduledoc """
  Public information for users
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field(:company, :string)
    field(:description, :string)
    field(:first, :string)
    field(:github, :string)
    field(:image, :string)
    field(:last, :string)
    field(:slug, :string)
    field(:title, :string)
    field(:twitter, :string)
    field(:user_id, :id)

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [
      :slug,
      :image,
      :first,
      :last,
      :company,
      :title,
      :github,
      :twitter,
      :description
    ])
    |> validate_required([:slug, :image, :first, :last])
    |> unique_constraint(:slug)
  end
end
