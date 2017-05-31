defmodule Concertrip.RoomView do
  use Concertrip.Web, :view

  def render("index.json", %{rooms: rooms}) do
    %{data: render_many(rooms, Concertrip.RoomView, "room.json")}
  end

  def render("show.json", %{rooms: rooms}) do
    %{data: render_one(Room, Concertrip.RoomView, "room.json")}
  end

  def render("room.json", %{room: room}) do
    %{id: room.id}
  end
end
