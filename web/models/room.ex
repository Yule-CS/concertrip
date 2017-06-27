defmodule Concertrip.Room do
  use Concertrip.Web, :model
  alias Concertrip.{Whiteboard, Repo}
  alias Ecto.Multi

  schema "rooms" do
    field :name, :string
    field :plan, :integer
    has_one :whiteboard, Whiteboard

    timestamps()
  end

  # TODO service patternに削り出すか調査する。
  def changesets(struct, params) do
    Multi.new
    |> Multi.insert(:room, changeset(struct, params))
    |> Multi.run(:whiteboard, fn %{room: room} ->
      whiteboard_changeset = %Whiteboard{room_id: room.id}
        |> Whiteboard.changeset()
      Repo.insert(whiteboard_changeset)
    end)
  end

  @required_fields ~w(name plan)
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> validate_required([:name])
  end
end
