defmodule Basics.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :slug, :string
      add :image, :string
      add :first, :string
      add :last, :string
      add :company, :string
      add :title, :string
      add :github, :string
      add :twitter, :string
      add :description, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:profiles, [:slug])
    create index(:profiles, [:user_id])
  end
end
