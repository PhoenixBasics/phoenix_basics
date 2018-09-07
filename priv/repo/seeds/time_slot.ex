defmodule Basics.Seeds.Schedule.TimeSlot do
  @moduledoc false

  alias Basics.Repo
  alias Basics.Schedule.TimeSlot

  def perform do
    Enum.each(data(), fn attrs ->
      %TimeSlot{}
      |> TimeSlot.changeset(attrs)
      |> Repo.insert!()
    end)
  end

  def data do
    [
      %{
        slug: "slot_1",
        start: "2018-09-06 07:00:00",
        finish: "2018-09-06 08:30:00"
      },
      %{
        slug: "slot_2",
        start: "2018-09-06 08:30:00",
        finish: "2018-09-06 08:45:00"
      },
      %{
        slug: "slot_3",
        start: "2018-09-06 08:45:00",
        finish: "2018-09-06 09:45:00"
      },
      %{
        slug: "slot_4",
        start: "2018-09-06 09:45:00",
        finish: "2018-09-06 10:15:00"
      },
      %{
        slug: "slot_5",
        start: "2018-09-06 10:15:00",
        finish: "2018-09-06 10:55:00"
      },
      %{
        slug: "slot_6",
        start: "2018-09-06 11:00:00",
        finish: "2018-09-06 11:40:00"
      },
      %{
        slug: "slot_7",
        start: "2018-09-06 11:40:00",
        finish: "2018-09-06 13:00:00"
      },
      %{
        slug: "slot_8",
        start: "2018-09-06 13:00:00",
        finish: "2018-09-06 13:40:00"
      },
      %{
        slug: "slot_9",
        start: "2018-09-06 13:45:00",
        finish: "2018-09-06 14:25:00"
      },
      %{
        slug: "slot_a",
        start: "2018-09-06 14:25:00",
        finish: "2018-09-06 15:00:00"
      },
      %{
        slug: "slot_b",
        start: "2018-09-06 15:00:00",
        finish: "2018-09-06 15:40:00"
      },
      %{
        slug: "slot_c",
        start: "2018-09-06 15:45:00",
        finish: "2018-09-06 16:25:00"
      },
      %{
        slug: "slot_d",
        start: "2018-09-06 16:25:00",
        finish: "2018-09-06 16:45:00"
      },
      %{
        slug: "slot_e",
        start: "2018-09-06 16:45:00",
        finish: "2018-09-06 18:15:00"
      },
      %{
        slug: "slot_f",
        start: "2018-09-07 08:00:00",
        finish: "2018-09-07 08:50:00"
      },
      %{
        slug: "slot_g",
        start: "2018-09-07 08:50:00",
        finish: "2018-09-07 09:05:00"
      },
      %{
        slug: "slot_h",
        start: "2018-09-07 09:05:00",
        finish: "2018-09-07 10:05:00"
      },
      %{
        slug: "slot_i",
        start: "2018-09-07 10:05:00",
        finish: "2018-09-07 10:35:00"
      },
      %{
        slug: "slot_j",
        start: "2018-09-07 10:35:00",
        finish: "2018-09-07 11:15:00"
      },
      %{
        slug: "slot_k",
        start: "2018-09-07 11:20:00",
        finish: "2018-09-07 12:00:00"
      },
      %{
        slug: "slot_l",
        start: "2018-09-07 12:00:00",
        finish: "2018-09-07 13:30:00"
      },
      %{
        slug: "slot_m",
        start: "2018-09-07 13:30:00",
        finish: "2018-09-07 14:10:00"
      },
      %{
        slug: "slot_n",
        start: "2018-09-07 14:15:00",
        finish: "2018-09-07 14:55:00"
      },
      %{
        slug: "slot_o",
        start: "2018-09-07 14:55:00",
        finish: "2018-09-07 15:30:00"
      },
      %{
        slug: "slot_p",
        start: "2018-09-07 15:30:00",
        finish: "2018-09-07 16:10:00"
      },
      %{
        slug: "slot_q",
        start: "2018-09-07 16:15:00",
        finish: "2018-09-07 16:55:00"
      },
      %{
        slug: "slot_r",
        start: "2018-09-07 16:55:00",
        finish: "2018-09-07 17:15:00"
      },
      %{
        slug: "slot_s",
        start: "2018-09-07 17:15:00",
        finish: "2018-09-07 17:30:00"
      },
      %{
        slug: "slot_t",
        start: "2018-09-07 17:30:00",
        finish: "2018-09-07 18:30:00"
      }
    ]
  end
end
