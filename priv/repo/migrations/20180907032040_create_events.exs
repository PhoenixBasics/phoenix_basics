defmodule Basics.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :is_talk, :boolean, default: false, null: false
      add :slug, :string
      add :title, :string
      add :description, :text
      add :time_slot_id, references(:time_slots, on_delete: :nilify_all)
      add :location_id, references(:locations, on_delete: :nilify_all)

      timestamps()
    end

    create unique_index(:events, [:slug])
    create index(:events, [:time_slot_id])
    create index(:events, [:location_id])
  end
end
