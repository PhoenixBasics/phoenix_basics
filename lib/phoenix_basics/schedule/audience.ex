defmodule Basics.Schedule.Audience do
  @moduledoc """
  Represents the relative skill level a speaker hopes participants have during
  an event
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Basics.Schedule.Event

  schema "audiences" do
    field(:name, :string)
    field(:slug, :string)

    many_to_many(:events, Event, join_through: "audiences_events")

    timestamps()
  end

  @doc false
  def changeset(audience, attrs) do
    audience
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
    |> unique_constraint(:slug)
  end
end
