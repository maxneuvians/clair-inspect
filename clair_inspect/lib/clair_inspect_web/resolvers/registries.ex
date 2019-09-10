defmodule ClairInspectWeb.Resolvers.Registries do
  def get(_parent, _params, _resolution) do
    {:ok, %{url: ClairInspect.Docker.registry()}}
  end
end
