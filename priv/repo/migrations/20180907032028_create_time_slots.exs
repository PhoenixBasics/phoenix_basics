defmodule Basics.Repo.Migrations.CreateTimeSlots do
  use Ecto.Migration

  def change do
    create table(:time_slots) do
      add :slug, :string
      add :start, :naive_datetime
      add :finish, :naive_datetime

      timestamps()
    end

    create unique_index(:time_slots, [:slug])
  end
end
