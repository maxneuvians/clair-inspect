defmodule ClairInspectWeb.Schema.Layers do
  use Absinthe.Schema.Notation

  @desc "A layer"
  object :layer do
    field :id, :id
    field :namespace_id, :integer
    field :name, :string
    field :parent_id, :integer
    field :engineversion, :integer
    field :created_at, :string
  end
end
