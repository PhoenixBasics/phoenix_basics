defmodule Basics.Schedule.Event do
  @moduledoc """
  Represents either a talk or other schedulable activity (such as lunch)
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field(:description, :string)
    field(:is_talk, :boolean, default: false)
    field(:slug, :string)
    field(:title, :string)
    field(:time_slot_id, :id)
    field(:location_id, :id)

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:is_talk, :slug, :title, :description])
    |> validate_required([:is_talk, :slug, :title, :description])
    |> unique_constraint(:slug)
  end
end
