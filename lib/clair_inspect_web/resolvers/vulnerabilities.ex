defmodule ClairInspectWeb.Resolvers.Vulnerabilities do
  alias ClairInspect.{Models, Repo}

  def find_vulnerability_by_id(_parent, %{id: id}, _resolution) do
    case  Repo.get(Models.Vulnerability, id) do
      nil ->
        {:error, "Vulnerability ID #{id} not found"}
      vulnerability ->
        {:ok, vulnerability}
    end
  end

  def find_vulnerabilities_by_namespace(namespace, _params, _resolution) do
    case  Repo.all(Models.Vulnerability.by_namespace_id(namespace.id)) do
      nil ->
        {:error, "No vulnerabilities found for namespace ID #{namespace.id}"}
      vulnerabilities ->
        {:ok, vulnerabilities}
    end
  end
end
