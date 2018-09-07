defmodule Basics.Repo.Migrations.CreateAudiences do
  use Ecto.Migration

  def change do
    create table(:audiences) do
      add :slug, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:audiences, [:slug])
  end
end
