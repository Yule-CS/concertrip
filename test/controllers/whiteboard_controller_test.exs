defmodule Concertrip.WhiteboardControllerTest do
  use Concertrip.ConnCase

  alias Concertrip.Whiteboard
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, whiteboard_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    whiteboard = Repo.insert! %Whiteboard{}
    conn = get conn, whiteboard_path(conn, :show, whiteboard)
    assert json_response(conn, 200)["data"] == %{"id" => whiteboard.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, whiteboard_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, whiteboard_path(conn, :create), whiteboard: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Whiteboard, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, whiteboard_path(conn, :create), whiteboard: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    whiteboard = Repo.insert! %Whiteboard{}
    conn = put conn, whiteboard_path(conn, :update, whiteboard), whiteboard: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Whiteboard, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    whiteboard = Repo.insert! %Whiteboard{}
    conn = put conn, whiteboard_path(conn, :update, whiteboard), whiteboard: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    whiteboard = Repo.insert! %Whiteboard{}
    conn = delete conn, whiteboard_path(conn, :delete, whiteboard)
    assert response(conn, 204)
    refute Repo.get(Whiteboard, whiteboard.id)
  end
end
