defmodule Concertrip.Repo.Migrations.CreateWhiteboard do
  use Ecto.Migration

  def change do
    create table(:whiteboards) do
      add :room_id, references(:rooms, on_delete: :nothing)

      timestamps()
    end
    create index(:whiteboards, [:room_id])

  end
end
