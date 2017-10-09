defmodule Concertrip.RoomResolver do
  alias Concertrip.{Repo, Room}

  def find(%{name: name}, info) do
    case Concertrip.Repo.get_by(Room, name: name) do
      nil -> {:error, %{code: :not_found, message: "Room name #{name} not found"}}
      room -> {:ok, room}
    end
  end

  def insert(%{name: name}, _info) do
    Repo.transaction(fn ->
      changeset = Room.changeset(%Room{name: name, plan: 1})
      with {:ok, room} <- Repo.insert(changeset),
        {:ok, _} <- room |> Ecto.build_assoc(:whiteboard) |> Repo.insert() do
          room
      else
        val -> Repo.rollback(val)
      end
    end)
    |> case do
      {:ok, room} -> {:ok, room}
      {:error, _} -> {:error, %{code: :bad_request, message: "Cannot create room"}}
    end
  end
end
