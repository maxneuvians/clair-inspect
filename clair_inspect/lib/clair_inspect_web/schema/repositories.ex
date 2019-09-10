defmodule ClairInspectWeb.Schema.Repositories do
  use Absinthe.Schema.Notation

  @desc "A docker repository"
  object :repository do
    field :name, :string
    field :layers, list_of(:layer) do
      resolve &ClairInspectWeb.Resolvers.Layers.find_layers_by_repository/3
    end
  end
end
