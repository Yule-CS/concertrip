defmodule Concertrip.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Concertrip.Repo

  object :whiteboard do
    field :id, :id
    field :room, :room, resolve: assoc(:room)
  end

  object :room do
    field :id, :id
    field :name, :string
    field :whiteboard, :whiteboard, resolve: assoc(:whiteboard)
  end
end
