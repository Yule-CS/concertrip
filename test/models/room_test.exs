defmodule Concertrip.RoomTest do
  use Concertrip.ModelCase

  alias Concertrip.Room

  @valid_attrs %{name: "some content", plan: 1, whiteboard: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Room.changeset(%Room{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Room.changeset(%Room{}, @invalid_attrs)
    refute changeset.valid?
  end
end
