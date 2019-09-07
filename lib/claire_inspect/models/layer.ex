defmodule ClairInspect.Models.Layer do
  import Ecto.Query
  use Ecto.Schema

  schema "layer" do
    field :namespace_id, :integer
    field :name, :string
    field :parent_id, :integer
    field :engineversion, :integer
    field :created_at, :utc_datetime
  end

  def by_namespace_id(namespace_id) do
    from(t in ClairInspect.Models.Layer, where: t.namespace_id == ^namespace_id)
  end
end
