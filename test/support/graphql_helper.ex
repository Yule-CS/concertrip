defmodule Concertrip.GraphqlHelper do
  use Phoenix.ConnTest
  @endpoint Concertrip.Endpoint

  def graphql_query(conn, options) do
    conn
    |> post("/api", build_query(options[:query], options[:variables]))
  end

  defp build_query(query, variables) do
    %{
      "query" => query,
      "variables" => variables
    }
  end
end
