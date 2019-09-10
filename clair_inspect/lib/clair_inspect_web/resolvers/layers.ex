defmodule ClairInspectWeb.Resolvers.Layers do
  alias ClairInspect.{Docker, Models, Repo}

  def find_layer_by_id(_parent, %{id: id}, _resolution) do
    case Repo.get(Models.Layer, id) do
      nil ->
        {:error, "Layer ID #{id} not found"}
      layer ->
        {:ok, layer}
    end
  end

  def find_layers_by_namespace(namespace, _params, _resolution) do
    case Repo.all(Models.Layer.by_namespace_id(namespace.id)) do
      nil ->
        {:error, "No layers found for namespace ID #{namespace.id}"}
      layers ->
        {:ok, layers}
    end
  end

  def find_layers_by_repository(repository, _params, _resolution) do
    case Docker.layers(repository.name) do
      [] ->
        {:ok, []}
      layers ->
        {:ok,
          layers
          |> Enum.map(fn l ->
            %{name:
              l
              |> String.split("?")
              |> hd()
              |> String.split("/")
              |> Enum.reverse()
              |> hd()
              |> Kernel.<>(":#{repository.name}")
          }
          end)
        }
    end
  end
end
