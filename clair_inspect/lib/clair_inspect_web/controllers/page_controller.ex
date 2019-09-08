defmodule ClairInspectWeb.PageController do
  use ClairInspectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
