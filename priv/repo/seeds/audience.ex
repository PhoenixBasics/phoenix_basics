defmodule Basics.Seeds.Schedule.Audience do
  @moduledoc false

  alias Basics.Repo
  alias Basics.Schedule.Audience

  def perform do
    Enum.each(data(), fn attrs ->
      %Audience{}
      |> Audience.changeset(attrs)
      |> Repo.insert!()
    end)
  end

  def data do
    [
      %{
        slug: "general",
        name: "General"
      },
      %{
        slug: "beginner",
        name: "Beginner"
      },
      %{
        slug: "intermediate",
        name: "Intermediate"
      },
      %{
        slug: "advanced",
        name: "Advanced"
      }
    ]
  end
end
