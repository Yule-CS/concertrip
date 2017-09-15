defmodule Concertrip.Schema do
  use Absinthe.Schema
  import_types Concertrip.Schema.Types

  query do
    field :rooms, :room do
      arg :name, non_null(:string)
      resolve &Concertrip.RoomResolver.find/2
    end
  end

  mutation do
    field :create_sticker, type: list_of(:sticker) do
      arg :room, non_null(:id)
      arg :sticker_set, list_of(non_null(:sticker_input))

      resolve &Concertrip.WhiteboardResolver.upsert_attributes/2
    end
  end
end
