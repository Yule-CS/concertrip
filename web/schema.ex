defmodule Concertrip.Schema do
  use Absinthe.Schema
  import_types Concertrip.Schema.Types

  query do
    field :rooms, list_of(:room) do
      resolve &Concertrip.RoomResolver.all/2
    end
  end
end
