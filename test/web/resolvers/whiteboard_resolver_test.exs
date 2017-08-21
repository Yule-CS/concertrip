defmodule Concertrip.WhiteboardResolverTest do
  use Concertrip.ConnCase
  alias Concertrip.{Room, Repo, Sticker}

  defp stringfy(v) when is_integer(v), do: Integer.to_string(v)
  defp stringfy(v), do: v
  defp mutation_skeleton(query) do
    %{
      "operationName" => "",
      "query" => "#{query}",
      "variables" => ""
    }
  end
  defp create_room do
    Repo.insert!(%Room{name: "room1", plan: 1})
      |> Ecto.build_assoc(:whiteboard)
      |> Repo.insert!
  end

  describe "Whiteboard Resolver" do
    test "upsert_attributes/2 insert stickers", context do
      room = create_room()
      query = """
        mutation {
          createSticker(room: #{room.id}, stickerSet: [{url: "test"  title: "test"}, {url: "test" title: "test"}])
            {
              id
              url
              title
            }
        }
      """
      res = context.conn
        |> post("/api", mutation_skeleton(query))

      struct = Repo.all(Sticker)
        |> Enum.map &Map.take(&1, [:id, :title, :url])

      expected = Enum.map(struct, fn a -> for {k, v} <- a, into: %{} do
          {Atom.to_string(k), stringfy(v)}
        end
      end)

      assert json_response(res, 200)["data"]["createSticker"] == expected
    end
  end
end
