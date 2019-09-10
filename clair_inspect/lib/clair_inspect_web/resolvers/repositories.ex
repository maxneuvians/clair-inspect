defmodule ClairInspectWeb.Resolvers.Repositories do
  def get(_parent, _params, _resolution) do

    case ClairInspect.Docker.catalog() do
      %{"repositories" => repositories} ->
          {:ok,
            repositories
            |> Enum.map(fn r -> %{name: r} end)
          }
      _ ->
        {:ok, []}
    end

  end
end
