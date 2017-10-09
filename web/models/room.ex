defmodule Concertrip.Room do
  use Concertrip.Web, :model
  alias Concertrip.Whiteboard

  schema "rooms" do
    field :name, :string
    field :plan, :integer
    has_one :whiteboard, Whiteboard

    timestamps()
  end

  @required_fields ~w(name plan)
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
