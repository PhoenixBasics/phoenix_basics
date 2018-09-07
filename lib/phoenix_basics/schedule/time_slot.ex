defmodule Basics.Schedule.TimeSlot do
  @moduledoc """
  Represents a period of time during which events can occur
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "time_slots" do
    field(:finish, :naive_datetime)
    field(:slug, :string)
    field(:start, :naive_datetime)

    timestamps()
  end

  @doc false
  def changeset(time_slot, attrs) do
    time_slot
    |> cast(attrs, [:slug, :start, :finish])
    |> validate_required([:slug, :start, :finish])
    |> unique_constraint(:slug)
  end
end
