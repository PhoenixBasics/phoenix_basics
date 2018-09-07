defmodule Basics.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :slug, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:locations, [:slug])
  end
end
