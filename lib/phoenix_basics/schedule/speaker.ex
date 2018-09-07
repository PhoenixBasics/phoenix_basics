defmodule Basics.Schedule.Speaker do
  @moduledoc """
  Someone leading a events
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

    timestamps()
  end

  @doc false
  def changeset(speaker, attrs) do
    speaker
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
    |> validate_required([
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
    |> unique_constraint(:slug)
  end
end
