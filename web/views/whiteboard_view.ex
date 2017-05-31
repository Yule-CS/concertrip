defmodule Concertrip.WhiteboardView do
  use Concertrip.Web, :view

  def render("index.json", %{whiteboards: whiteboards}) do
    %{data: render_many(whiteboards, Concertrip.WhiteboardView, "whiteboard.json")}
  end

  def render("show.json", %{whiteboard: whiteboard}) do
    %{data: render_one(whiteboard, Concertrip.WhiteboardView, "whiteboard.json")}
  end

  def render("whiteboard.json", %{whiteboard: whiteboard}) do
    %{id: whiteboard.id}
  end
end
