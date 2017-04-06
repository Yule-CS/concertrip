defmodule Concertrip.PageController do
  use Concertrip.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
