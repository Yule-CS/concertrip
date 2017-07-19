defmodule Concertrip.Sticker do
  use Concertrip.Web, :model

  schema "stickers" do
    field :url, :string
    field :title, :string
    belongs_to :whiteboard, Concertrip.Whiteboard

    timestamps()
  end

  @required_params ~w(url title)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
