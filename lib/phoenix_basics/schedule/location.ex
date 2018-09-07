defmodule Basics.Schedule.Location do
  @moduledoc """
  Represents the physical area an event will occur
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field(:name, :string)
    field(:slug, :string)

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
    |> unique_constraint(:slug)
  end
end
