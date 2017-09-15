defmodule Concertrip.RoomResolver do
  alias Concertrip.{Repo, Room}

  def find(%{name: name}, info) do
    case Concertrip.Repo.get_by(Room, name: name) do
      nil -> {:error, %{code: :not_found, message: "Room name #{name} not found"}}
      room -> {:ok, room}
    end
  end
end
