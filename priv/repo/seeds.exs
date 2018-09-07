# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Basics.Repo.insert!(%Basics.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Code.compile_file("audience.ex", "./priv/repo/seeds")
Code.compile_file("category.ex", "./priv/repo/seeds")
Code.compile_file("event.ex", "./priv/repo/seeds")
Code.compile_file("location.ex", "./priv/repo/seeds")
Code.compile_file("schedule.ex", "./priv/repo/seeds")
Code.compile_file("speaker.ex", "./priv/repo/seeds")
Code.compile_file("time_slot.ex", "./priv/repo/seeds")

Basics.Seeds.Schedule.seed()
