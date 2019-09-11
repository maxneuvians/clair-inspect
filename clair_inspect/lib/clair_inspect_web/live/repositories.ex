defmodule ClairInspectWeb.RepositoriesLive do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(ClairInspectWeb.PageView, "live/repositories", assigns)
  end

  def mount(_session, socket) do
    send(self(), :update)
    {:ok, assign(socket, :repositories, [])}
  end

  def handle_info(:update, socket) do
    repositories =
      ClairInspect.Docker.catalog()
      |> Map.get("repositories")

    {:noreply, assign(socket, :repositories, repositories)}
  end
end
