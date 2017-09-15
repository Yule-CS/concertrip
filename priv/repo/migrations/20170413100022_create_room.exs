defmodule Concertrip.Repo.Migrations.CreateRoom do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :plan, :integer
      add :whiteboard, :integer

      timestamps()
    end

    create index(:rooms, [:name], unique: true)
  end
end
