defmodule ClairInspectWeb.Schema.Namespaces do
  use Absinthe.Schema.Notation

  @desc "A namespace"
  object :namespace do
    field :id, :id
    field :name, :string
    field :version_format, :string
    field :features, list_of(:feature) do
      resolve &ClairInspectWeb.Resolvers.Features.find_features_by_namespace/3
    end
    field :layers, list_of(:layer) do
      resolve &ClairInspectWeb.Resolvers.Layers.find_layers_by_namespace/3
    end
    field :vulnerabilities, list_of(:vulnerability) do
      resolve &ClairInspectWeb.Resolvers.Vulnerabilities.find_vulnerabilities_by_namespace/3
    end
  end
end
