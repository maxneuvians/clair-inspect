defmodule ClairInspectWeb.Resolvers.Features do
  alias ClairInspect.{Models, Repo}

  def find_feature_by_id(_parent, %{id: id}, _resolution) do
    case  Repo.get(Models.Feature, id) do
      nil ->
        {:error, "Feature ID #{id} not found"}
      feature ->
        {:ok, feature}
    end
  end

  def find_features_by_namespace(namespace, _params, _resolution) do
    case  Repo.all(Models.Feature.by_namespace_id(namespace.id)) do
      nil ->
        {:error, "No features found for namespace ID #{namespace.id}"}
      features ->
        {:ok, features}
    end
  end
end
