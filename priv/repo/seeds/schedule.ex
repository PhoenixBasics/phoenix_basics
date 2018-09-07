defmodule Basics.Seeds.Schedule do
  @moduledoc false

  alias Basics.Seeds.Schedule.Audience
  alias Basics.Seeds.Schedule.Category
  alias Basics.Seeds.Schedule.Event
  alias Basics.Seeds.Schedule.Location
  alias Basics.Seeds.Schedule.Speaker
  alias Basics.Seeds.Schedule.TimeSlot

  def seed do
    TimeSlot.perform()
    Location.perform()
    Category.perform()
    Audience.perform()
    Speaker.perform()
    Event.perform()
  end
end
