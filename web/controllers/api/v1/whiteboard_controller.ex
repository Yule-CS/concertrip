defmodule Concertrip.WhiteboardController do
  use Concertrip.Web, :controller

  alias Concertrip.Whiteboard

  def index(conn, _params) do
    whiteboards = Repo.all(Whiteboard)
    render(conn, "index.json", whiteboards: whiteboards)
  end

  def create(conn, %{"whiteboard" => whiteboard_params}) do
    changeset = Whiteboard.changeset(%Whiteboard{}, whiteboard_params)

    case Repo.insert(changeset) do
      {:ok, whiteboard} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", room_whiteboard_path(conn, :show, whiteboard))
        |> render("show.json", whiteboard: whiteboard)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Concertrip.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    whiteboard = Repo.get!(Whiteboard, id)
    render(conn, "show.json", whiteboard: whiteboard)
  end

  def update(conn, %{"id" => id, "whiteboard" => whiteboard_params}) do
    whiteboard = Repo.get!(Whiteboard, id)
    changeset = Whiteboard.changeset(whiteboard, whiteboard_params)

    case Repo.update(changeset) do
      {:ok, whiteboard} ->
        render(conn, "show.json", whiteboard: whiteboard)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Concertrip.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    whiteboard = Repo.get!(Whiteboard, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(whiteboard)

    send_resp(conn, :no_content, "")
  end
end
