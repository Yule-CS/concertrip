defmodule Concertrip.Room do
  use Concertrip.Web, :model

  schema "rooms" do
    field :name, :string
    field :plan, :integer
    field :whiteboard, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :plan, :whiteboard])
    |> validate_required([:name, :plan, :whiteboard])
  end
end
