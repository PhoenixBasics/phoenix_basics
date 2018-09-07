defmodule Basics.Schedule.Event do
  @moduledoc """
  Represents either a talk or other schedulable activity (such as lunch)
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Basics.Schedule.Audience
  alias Basics.Schedule.Category
  alias Basics.Schedule.Location
  alias Basics.Schedule.Speaker
  alias Basics.Schedule.TimeSlot

  schema "events" do
    field(:description, :string)
    field(:is_talk, :boolean, default: false)
    field(:slug, :string)
    field(:title, :string)

    belongs_to(:time_slot, TimeSlot)
    belongs_to(:location, Location)

    many_to_many(:speakers, Speaker, join_through: "events_speakers")
    many_to_many(:audiences, Audience, join_through: "audiences_events")
    many_to_many(:categories, Category, join_through: "categories_events")

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:is_talk, :slug, :title, :description, :location_id, :time_slot_id])
    |> validate_required([:is_talk, :slug, :title, :time_slot_id])
    |> type_specific_changes(attrs)
    |> unique_constraint(:slug)
  end

  def type_specific_changes(change, %{is_talk: true} = attrs) do
    change
    |> validate_required([:location_id])
    |> put_assoc(:speakers, attrs[:speakers])
    |> put_assoc(:audiences, attrs[:audiences])
    |> put_assoc(:categories, attrs[:categories])
  end

  def type_specific_changes(change, _), do: change
end
