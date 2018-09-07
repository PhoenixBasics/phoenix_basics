defmodule Basics.Schedule.Category do
  @moduledoc """
  Represents a topic for an event
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Basics.Schedule.Event

  schema "categories" do
    field(:name, :string)
    field(:slug, :string)

    many_to_many(:events, Event, join_through: "categories_events")

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
    |> unique_constraint(:slug)
  end
end
