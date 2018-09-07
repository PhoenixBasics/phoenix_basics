defmodule Basics.Schedule do
  @moduledoc """
  Responsible for managing event information
  """

  import Ecto.Query
  alias Basics.Repo
  alias Basics.Schedule.TimeSlot

  @doc """
  This query will return a list of date tuples in a year, month, day format
  ex
  iex> Basics.Schedule.all_days_in_schedule
  [{2018, 9, 5}, {2018, 9, 6}, {2018, 9, 7}]
  """
  def all_days_in_schedule do
    TimeSlot
    |> select([time_slot], fragment("?::date", time_slot.start))
    |> distinct(true)
    |> Repo.all()
    |> Enum.sort
  end

  def time_slots_for_day(day_to_return) do
    TimeSlot
    |> where([time_slot], fragment("?::date", time_slot.start) == ^to_date(day_to_return))
    |> order_by(asc: :start)
    |> Repo.all
  end

  def to_date(nil), do: first_day_in_schedule()
  def to_date(day_to_return) when is_binary(day_to_return) do
    day_to_return
    |> Timex.parse!("%Y-%m-%d", :strftime)
    |> NaiveDateTime.to_date()
  end

  defp first_day_in_schedule() do
    TimeSlot
    |> select([time_slot], time_slot.start)
    |> order_by(asc: :start)
    |> limit(1)
    |> Repo.one
    |> NaiveDateTime.to_date()
  end
end
