defmodule Basics.Repo.Migrations.CreateAudiencesEvents do
  use Ecto.Migration

  def change do
    create table(:audiences_events) do
      add :audience_id, references(:audiences, on_delete: :delete_all)
      add :event_id, references(:events, on_delete: :delete_all)
    end

    create unique_index(:audiences_events, [:audience_id, :event_id])
    create index(:audiences_events, [:audience_id])
    create index(:audiences_events, [:event_id])
  end
end
