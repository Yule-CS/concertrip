defmodule ESpec.Phoenix.Extend do
  def model do
    quote do
      alias Concertrip.Repo
    end
  end

  def controller do
    quote do
      alias Concertrip
      import Concertrip.Router.Helpers

      @endpoint Concertrip.Endpoint
    end
  end

  def view do
    quote do
      import Concertrip.Router.Helpers
    end
  end

  def channel do
    quote do
      alias Concertrip.Repo

      @endpoint Concertrip.Endpoint
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
