defmodule ClairInspectWeb.Schema.Features do
  use Absinthe.Schema.Notation

  @desc "A feature"
  object :feature do
    field :id, :id
    field :namespace_id, :integer
    field :name, :string
  end
end
