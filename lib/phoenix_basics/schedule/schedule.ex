defmodule Basics.Schedule do
  @moduledoc """
  Responsible for managing event information
  """

  import Ecto.Query
  alias Basics.Repo
  alias Basics.Schedule.TimeSlot
  alias Basics.Schedule.Category
  alias Basics.Schedule.Audience
  alias Basics.Schedule.Event

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

  def time_slots_for_day(opts) do
    TimeSlot
    |> where([time_slot], fragment("?::date", time_slot.start) == ^opts[:day])
    |> join(:left, [time_slot], events in assoc(time_slot, :events))
    |> audience_where_statement(opts)
    |> category_where_statement(opts)
    |> preload([_, events], [events: {events, [:location, :speakers, :audiences, :categories]}])
    |> order_by(asc: :start)
    |> Repo.all
  end
  def audience_where_statement(query, %{audiences: audiences}) do
    audience_ids = Enum.map(audiences, fn(%{id: id}) -> id end)

    from [_, events] in query,
    join: audiences_events in "audiences_events", on: audiences_events.event_id == events.id,
    where: audiences_events.audience_id in ^audience_ids
  end
  def audience_where_statement(query, _), do: query

  def category_where_statement(query, %{categories: categories}) do
    category_ids = Enum.map(categories, fn(%{id: id}) -> id end)

    from [_, events] in query,
    join: categories_events in "categories_events", on: categories_events.event_id == events.id,
    where: categories_events.category_id in ^category_ids
  end
  def category_where_statement(query, _), do: query

  def to_date(nil), do: first_day_in_schedule()
  def to_date(day_to_return) when is_binary(day_to_return) do
    day_to_return
    |> Timex.parse!("%Y-%m-%d", :strftime)
    |> NaiveDateTime.to_date()
  end

  def day_pagination(current_date) do
    {
      current_date |> yesterday_query() |> fetch_date(),
      current_date |> tomorrow_query() |> fetch_date()
    }
  end

  def fetch_categories_by_slug(slugs) do
    Category
    |> where([category], category.slug in ^slugs)
    |> Repo.all
  end

  def fetch_audiences_by_slug(slugs) do
    Audience
    |> where([audience], audience.slug in ^slugs)
    |> Repo.all
  end

  def fetch_talk(slug) do
    Event
    |> where([event], event.slug == ^slug)
    |> preload([:time_slot, :location, :speakers, :audiences, :categories])
    |> Repo.one
  end

  defp fetch_date(query) do
    query
    |> Repo.one()
    |> _fetch_date()
  end

  defp _fetch_date(nil), do: nil
  defp _fetch_date(date_tuple), do: Timex.to_date(date_tuple)

  defp yesterday_query(date) do
    from ts in "time_slots",
    group_by: fragment("?::date", ts.start),
    having: fragment("?::date", ts.start) < ^date,
    order_by: [desc: fragment("?::date", ts.start)],
    limit: 1,
    select: fragment("?::date", ts.start)
  end

  defp tomorrow_query(date) do
    from ts in "time_slots",
    group_by: fragment("?::date", ts.start),
    having: fragment("?::date", ts.start) > ^date,
    order_by: [asc: fragment("?::date", ts.start)],
    limit: 1,
    select: fragment("?::date", ts.start)
  end

  defp first_day_in_schedule do
    TimeSlot
    |> select([time_slot], time_slot.start)
    |> order_by(asc: :start)
    |> limit(1)
    |> Repo.one
    |> NaiveDateTime.to_date()
  end
end
