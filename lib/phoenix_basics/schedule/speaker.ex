defmodule Basics.Schedule.Speaker do
  @moduledoc """
  Someone leading a events
  """

  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  alias Basics.Schedule.Event
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

    many_to_many :events, Event, join_through: "events_speakers"

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
    |> validate_required([:slug, :image, :first, :last, :description])
    |> cast_attachments(attrs, [:image])
    |> unique_constraint(:slug)
  end
end
