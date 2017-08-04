defmodule Concertrip.WhiteboardResolver do
  alias Concertrip.{Repo, Whiteboard, Sticker}
  import Ecto.Query

  def upsert_attributes(%{room: id, sticker_set: params}, _info) do
    changeset = Whiteboard
    |> Repo.get_by(room_id: id)
    |> Repo.preload(stickers: retieve_associtation_with(params))
    |> Whiteboard.changeset(%{stickers: params})

    # TODO how do I retrieve the stciker natually.
    {:ok, whiteboard} = Repo.update(changeset)
    {:ok, whiteboard.stickers}
  end

  # TODO ask someone to pass data to macro through pipe
  defp retieve_associtation_with params do
    from s in Sticker, where: s.id in ^(params
      |> Enum.map &Map.get(&1, :id)
    )
  end
end
