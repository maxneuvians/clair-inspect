defmodule ClairInspectWeb.Schema.Registries do
  use Absinthe.Schema.Notation

  @desc "A docker registry"
  object :registry do
    field :url, :string
    field :repositories, list_of(:repository) do
      resolve &ClairInspectWeb.Resolvers.Repositories.get/3
    end
  end
end
