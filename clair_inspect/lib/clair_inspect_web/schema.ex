defmodule ClairInspectWeb.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom
  import_types ClairInspectWeb.Schema.Features
  import_types ClairInspectWeb.Schema.Layers
  import_types ClairInspectWeb.Schema.Namespaces
  import_types ClairInspectWeb.Schema.Vulnerabilities

  alias ClairInspectWeb.Resolvers

  query do

    @desc "Get a namespace by id"
    field :namespace, :namespace do
      arg :id, non_null(:id)
      resolve &Resolvers.Namespaces.find_namespace_by_id/3
    end

    @desc "Get all namespaces"
    field :namespaces, list_of(:namespace) do
      resolve &Resolvers.Namespaces.get/3
    end

    @desc "Get a feature by id"
    field :feature, :feature do
      arg :id, non_null(:id)
      resolve &Resolvers.Features.find_feature_by_id/3
    end

    @desc "Get a layer by id"
    field :layer, :layer do
      arg :id, non_null(:id)
      resolve &Resolvers.Layers.find_layer_by_id/3
    end

    @desc "Get a vulnerability by id"
    field :vulnerability, :vulnerability do
      arg :id, non_null(:id)
      resolve &Resolvers.Vulnerabilities.find_vulnerability_by_id/3
    end

  end
end
