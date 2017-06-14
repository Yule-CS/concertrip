defmodule Concertrip.RoomResolver do
  alias Concertrip.Repo
  alias Concertrip.Room

  def all(_args, _info) do
    {:ok, Repo.all(Room)}
  end
end
