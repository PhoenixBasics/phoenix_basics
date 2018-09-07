defmodule Basics.Repo.Migrations.CreateCategoriesEvents do
  use Ecto.Migration

  def change do
    create table(:categories_events) do
      add :category_id, references(:categories, on_delete: :delete_all)
      add :event_id, references(:events, on_delete: :delete_all)
    end

    create unique_index(:categories_events, [:category_id, :event_id])
    create index(:categories_events, [:category_id])
    create index(:categories_events, [:event_id])
  end
end
