defmodule ClairInspect.Models.Feature do
  import Ecto.Query
  use Ecto.Schema

  schema "feature" do
    field :namespace_id, :integer
    field :name, :string
  end

  def by_namespace_id(namespace_id) do
    from(t in ClairInspect.Models.Feature, where: t.namespace_id == ^namespace_id)
  end
end
