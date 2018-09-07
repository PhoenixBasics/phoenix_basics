defmodule Basics.Repo.Migrations.CreateEventsSpeakers do
  use Ecto.Migration

  def change do
    create table(:events_speakers) do
      add :speaker_id, references(:profiles, on_delete: :delete_all)
      add :event_id, references(:events, on_delete: :delete_all)
    end

    create unique_index(:events_speakers, [:speaker_id, :event_id])
    create index(:events_speakers, [:speaker_id])
    create index(:events_speakers, [:event_id])
  end
end
