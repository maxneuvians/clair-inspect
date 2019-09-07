defmodule ClairInspectWeb.Schema.Vulnerabilities do
  use Absinthe.Schema.Notation

  @desc "A known vulnerability"
  object :vulnerability do
    field :id, :id
    field :namespace_id, :integer
    field :name, :string
    field :description, :string
    field :link, :string
    field :severity, :string
    field :metadata, :string
    field :created_at, :string
    field :deleted_at, :string
  end
end
