defmodule Basics.Membership.Profile do
  @moduledoc """
  Public information for users
  """

  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  alias Basics.Membership.User
  alias PhoenixBasics.Arc.Image.Type, as: ImageType

  schema "profiles" do
    field(:company, :string)
    field(:description, :string)
    field(:first, :string)
    field(:github, :string)
    field(:image, ImageType)
    field(:last, :string)
    field(:slug, :string)
    field(:title, :string)
    field(:twitter, :string)

    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def init_changeset(info, attrs) do
    info
    |> cast(attrs, [:user_id, :slug])
    |> validate_required([:user_id, :slug])
    |> unique_constraint(:user_id)
    |> unique_constraint(:slug)
  end

  @doc false
  def changeset(info, attrs) do
    info
    |> cast(attrs, [
      :first,
      :last,
      :slug,
      :company,
      :github,
      :twitter,
      :description,
      :title,
      :image
    ])
    |> validate_exclusion(:slug, [:edit, :new])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:first, :last, :slug])
    |> validate_exclusion(:slug, [:edit, :new])
    |> unique_constraint(:slug)
  end
end
