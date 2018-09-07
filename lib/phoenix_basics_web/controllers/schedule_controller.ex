defmodule BasicsWeb.ScheduleController do
  use BasicsWeb, :controller

  alias Basics.Schedule

  def index(conn, params) do
    render(conn, "index.html", schedule_dates: Schedule.all_days_in_schedule(),
                               time_slots: Schedule.time_slots_for_day(params["day"]),
                               current_date: params["day"] |> Schedule.to_date() |> Timex.format!("%A  %m/%d/%y", :strftime))
  end
end
