defmodule Concertrip.Repo.Migrations.CreateSticker do
  use Ecto.Migration

  def change do
    create table(:stickers) do
      add :url, :string
      add :title, :string
      add :whiteboard_id, references(:whiteboards, on_delete: :nothing)

      timestamps()
    end
    create index(:stickers, [:whiteboard_id])

  end
end
