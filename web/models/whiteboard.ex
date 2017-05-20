defmodule Concertrip.Whiteboard do
  use Concertrip.Web, :model

  schema "whiteboards" do
    belongs_to :room, Concertrip.Room

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:room_id])
    |> validate_required([:room_id])
  end
end
