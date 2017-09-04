defmodule Concertrip.WhiteboardTest do
  use Concertrip.ModelCase

  alias Concertrip.Whiteboard

  @valid_attrs %{stickers: [%{title: "test", url: "test"}]}
  #@invalid_attrs %{test: ""}

  test "changeset with valid attributes" do
    changeset = Whiteboard.changeset(%Whiteboard{}, @valid_attrs)
    assert changeset.valid?
  end

  #test "changeset with invalid attributes" do
  #  changeset = Whiteboard.changeset(%Whiteboard{}, @invalid_attrs)
  #  refute changeset.valid?
  #end
end
