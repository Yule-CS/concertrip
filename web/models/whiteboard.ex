defmodule Concertrip.Whiteboard do
  use Concertrip.Web, :model

  schema "whiteboards" do
    belongs_to :room, Concertrip.Room
    has_many :stickers, Concertrip.Sticker

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:id, :room_id])
    |> cast_assoc(:stickers)
  end
end
