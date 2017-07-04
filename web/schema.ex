defmodule Concertrip.Schema do
  use Absinthe.Schema
  import_types Concertrip.Schema.Types

  query do
    field :rooms, list_of(:room) do
      resolve &Concertrip.RoomResolver.all/2
    end
  end

  mutation do
    field :create_sticker, type: list_of(:sticker) do
      arg :room, non_null(:id)
      arg :sticker_set, list_of(non_null(:sticker_input))

      resolve &Concertrip.WhiteboardResolver.update/2
    end
  end
end
