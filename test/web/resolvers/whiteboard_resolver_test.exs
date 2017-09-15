defmodule Concertrip.WhiteboardResolverTest do
  use Concertrip.ConnCase
  alias Concertrip.{Room, Repo, Whiteboard}

  @valid_attrs [
    %{url: Faker.Internet.url, title: Faker.Name.title},
    %{url: Faker.Internet.url, title: Faker.Name.title},
  ]
  @query """
    mutation createSticker($room: ID!, $sticker_input: [StickerInput!]!) {
      createSticker(room: $room, stickerSet: $sticker_input)
        {
          id
          url
          title
        }
    }
  """

  defp create_room(name \\ "room") do
    %Room{name: name, plan: 1}
    |> Repo.insert!
    |> Ecto.build_assoc(:whiteboard)
    |> Repo.insert!
  end

  defp create_stickers(room_id) do
    whiteboard = Repo.get_by(Whiteboard, room_id: room_id)
    Enum.map @valid_attrs, fn valid_attr ->
      whiteboard
      |> Ecto.build_assoc(:stickers, valid_attr)
      |> Repo.insert!
    end
  end

  describe "request with valid data" do
    test "upsert_attributes/2 insert stickers", context do
      room = create_room
      res = context.conn
      |> graphql_query(query: @query,
           variables: Map.merge(%{room: room.id},
                                %{sticker_input: @valid_attrs}))
      |> json_response(200)

      res["data"]["createSticker"]
      |> Stream.zip(@valid_attrs)
      |> Enum.each(fn {res, expected} ->
        assert res["title"] == expected[:title]
        assert res["url"] == expected[:url]
      end)
    end

    test "upsert_attributes/2 update stickers", context do
      room = create_room
      stickers = room.id
                 |> create_stickers
                 |> Stream.map(&Map.take(&1, [:id]))
                 |> Enum.map(&Map.merge(&1, %{title: "expected", url: "expected"}))

      variables = Map.merge(%{room: room.id}, %{sticker_input: stickers})

      res = context.conn
      |> graphql_query(query: @query, variables: variables)
      |> json_response(200)

      res["data"]["createSticker"]
      |> Stream.zip(stickers)
      |> Enum.each(fn {res, expected} ->
        assert res["id"] == to_string expected[:id]
        assert res["title"] == expected[:title]
        assert res["url"] == expected[:url]
      end)
    end

    test "upsert_attributes/2 ignore sticker id which belongs to other rooms.
          Then create stickers based on new serial id", context do
      room1 = create_room("room1")
      room2 = create_room("room2")
      stickers = room2.id
                 |> create_stickers
                 |> Stream.map(&Map.take(&1, [:id]))
                 |> Enum.map(&Map.merge(&1, %{title: "expected", url: "expected"}))

      variables = Map.merge(%{room: room1.id}, %{sticker_input: stickers})

      res = context.conn
      |> graphql_query(query: @query, variables: variables)
      |> json_response(200)

      res["data"]["createSticker"]
      |> Stream.zip(stickers)
      |> Enum.each(fn {res, expected} ->
        refute res["id"] == to_string expected[:id]
        assert res["title"] == expected[:title]
        assert res["url"] == expected[:url]
      end)
    end
  end

  describe "request with invalid attr" do
    test "attr have extra attribute", context do
      room = create_room
      invalid_attrs = [
        %{
          url: Faker.Internet.url,
          title: Faker.Name.title,
          invalid: "an extra attre"
        }
      ]

      res = context.conn
      |> graphql_query(query: @query,
           variables: Map.merge(%{room: room.id},
                                %{sticker_input: invalid_attrs}))
      |> json_response(400)

      assert res["errors"]
      refute res["data"]
    end

    test "attr don't have a url", context do
      room = create_room
      invalid_attrs = [
        %{
          title: Faker.Name.title,
        }
      ]

      res = context.conn
      |> graphql_query(query: @query,
           variables: Map.merge(%{room: room.id},
                                %{sticker_input: invalid_attrs}))
      |> json_response(400)

      assert res["errors"]
      refute res["data"]
    end
  end
end
