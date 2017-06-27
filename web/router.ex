defmodule Concertrip.Router do
  use Concertrip.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: Concertrip.Schema

  # Is it necessary to go through api pipline for parsing json?
  forward "/api", Absinthe.Plug,
    schema: Concertrip.Schema

  scope "/", Concertrip do
    pipe_through :browser # Use the default browser stack
    get "/*path", PageController, :index
  end
end
