defmodule ClairInspectWeb.Resolvers.Namespaces do
  alias ClairInspect.{Models, Repo}

  def find_namespace_by_id(_parent, %{id: id}, _resolution) do
    case  Repo.get(Models.Namespace, id) do
      nil ->
        {:error, "Namespace ID #{id} not found"}
      namespace ->
        {:ok, namespace}
    end
  end

  def get(_parent, _params, _resolution), do: {:ok, Repo.all(Models.Namespace)}
end
