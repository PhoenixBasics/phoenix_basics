defmodule Basics.Seeds.Schedule.Category do
  @moduledoc false

  alias Basics.Repo
  alias Basics.Schedule.Category

  def perform do
    Enum.each(data(), fn attrs ->
      %Category{}
      |> Category.changeset(attrs)
      |> Repo.insert!()
    end)
  end

  def data do
    [
      %{
        slug: "blockchain",
        name: "Blockchain"
      },
      %{
        slug: "bots",
        name: "Bots"
      },
      %{
        slug: "code_quality",
        name: "Code Quality"
      },
      %{
        slug: "deployment",
        name: "Deployment"
      },
      %{
        slug: "distributed_systems",
        name: "Distributed Systems"
      },
      %{
        slug: "elixir",
        name: "Elixir"
      },
      %{
        slug: "genstage",
        name: "GenStage"
      },
      %{
        slug: "hex",
        name: "Hex"
      },
      %{
        slug: "keynote",
        name: "Keynote"
      },
      %{
        slug: "nerves",
        name: "Nerves"
      },
      %{
        slug: "nif",
        name: "NIF"
      },
      %{
        slug: "phoenix",
        name: "Phoenix"
      },
      %{
        slug: "phoenix_production",
        name: "Phoenix / Production"
      },
      %{
        slug: "production",
        name: "Production"
      },
      %{
        slug: "testing",
        name: "Testing"
      },
      %{
        slug: "ui",
        name: "UI"
      },
      %{
        slug: "otp",
        name: "OTP"
      },
      %{
        slug: "monitoring",
        name: "Monitoring"
      }
    ]
  end
end
