defmodule BasicsWeb.ScheduleController do
  use BasicsWeb, :controller

  alias Basics.Schedule

  plug BasicsWeb.Plugs.CurrentScheduleParams

  def index(conn, params) do
    render(conn, "index.html", time_slots: Schedule.time_slots_for_day(conn.assigns.current_schedule_params))
  end

  def show(conn, %{"id" => slug}) do
    render(conn, "show.html", talk: Schedule.fetch_talk(slug))
  end
end
