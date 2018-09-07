defmodule Basics.ScheduleTest do
  @moduledoc false
  use Basics.DataCase
  alias Basics.Repo
  alias Basics.Schedule
  alias Basics.Schedule.TimeSlot

  describe "given multiple time slots exist" do
    setup do
      [
        %{
          slug: "slot_f",
          start: "2018-09-07 08:00:00",
          finish: "2018-09-07 08:50:00"
        },
        %{
          slug: "slot_e",
          start: "2018-09-06 16:45:00",
          finish: "2018-09-06 18:15:00"
        }
      ]
      |> Enum.each(fn attrs ->
        %TimeSlot{}
        |> TimeSlot.changeset(attrs)
        |> Repo.insert!()
      end)
    end

    test "all_days_in_schedule/0 returns both start times in order" do
      [thurs, fri] = Schedule.all_days_in_schedule()
      assert thurs == {2018, 9, 6}
      assert fri == {2018, 9, 7}
    end

    @doc """
    This is kind of a useless test - but I wanted to show an example of
    having a test implementation be a pipeline. It is also a chance to use
    `Enum.reduce` (my favorite method) and MapSet (my favorite datatype).

    Enjoy!
    """
    test "time_slots_for_day/1 returns one day's worth of timeslots" do
      Schedule.time_slots_for_day(nil)
      |> Enum.reduce(MapSet.new, fn(time_slot, acc) ->
           MapSet.put(acc, Timex.format!(time_slot.start, "%Y-%m-%d", :strftime))
         end)
      |> Enum.count()
      |> Kernel.==(1)
      |> assert
    end

    test "time_slots_for_day/1 returns the first schedule day if passed nil" do
      [day|_] =
        Schedule.time_slots_for_day(nil)
        |> Enum.reduce(MapSet.new, fn(time_slot, acc) ->
             MapSet.put(acc, Timex.format!(time_slot.start, "%Y-%m-%d", :strftime))
           end)
        |> MapSet.to_list

      assert day == "2018-09-06"
    end

    test "time_slots_for_day/1 returns the requested day if passed a date string" do
      [day|_] =
        Schedule.time_slots_for_day("2018-09-07")
        |> Enum.reduce(MapSet.new, fn(time_slot, acc) ->
             MapSet.put(acc, Timex.format!(time_slot.start, "%Y-%m-%d", :strftime))
           end)
        |> MapSet.to_list

      assert day == "2018-09-07"
    end
  end
end
