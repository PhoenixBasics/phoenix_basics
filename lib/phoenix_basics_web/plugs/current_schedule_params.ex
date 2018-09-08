defmodule BasicsWeb.Plugs.CurrentScheduleParams do
  @moduledoc """
  Plug that populates the current_user assigns
  """

  alias Plug.Conn
  alias Basics.Schedule

  def init(opts), do: opts

  def call(conn, _opts) do
    Conn.assign(conn, :current_schedule_params, schedule_params(conn))
  end

  def schedule_params(conn) do
    %{}
    |> add_current_day(conn)
    |> add_category(conn)
    |> add_audience(conn)
  end

  def add_current_day(opts, %{params: params}) do
    current_day = Schedule.to_date(params["date"])
    {last_day, next_day} = Schedule.day_pagination(current_day)

    opts
    |> Map.put(:all_dates, Schedule.all_days_in_schedule())
    |> Map.put(:day, current_day)
    |> Map.put(:last_day, last_day)
    |> Map.put(:next_day, next_day)
  end

  def add_category(opts, %{params: %{"category" => categories}}) do
    Map.put(opts, :categories, Schedule.fetch_categories_by_slug(categories))
  end
  def add_category(opts, _), do: opts

  def add_audience(opts, %{params: %{"audience" => audiences}}) do
    Map.put(opts, :audiences, Schedule.fetch_audiences_by_slug(audiences))
  end
  def add_audience(opts, _), do: opts
end
