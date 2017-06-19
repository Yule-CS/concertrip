defmodule Concertrip.Sticker do
  use Concertrip.Web, :model

  schema "stickers" do
    field :url, :string
    field :title, :string
    belongs_to :whitedoard, Concertrip.Whitedoard

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title])
    |> validate_required([:url, :title])
  end
end
