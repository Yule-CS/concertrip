defmodule Concertrip.Repo.Migrations.ChangeFieldRooms do
  use Ecto.Migration

  def change do
    alter table(:rooms) do
      remove :whiteboard
      add :whiteboards_id, references(:whiteboards, on_delete: :nothing)
    end
  end
end
