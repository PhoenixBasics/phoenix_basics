defmodule Basics.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :slug, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:categories, [:slug])
  end
end
