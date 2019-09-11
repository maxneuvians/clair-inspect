defmodule ClairInspectWeb.Router do
  use ClairInspectWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ClairInspectWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  forward "/api", Absinthe.Plug,
    schema: ClairInspectWeb.Schema

  forward "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: ClairInspectWeb.Schema,
    interface: :simple
end
