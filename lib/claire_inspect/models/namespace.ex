defmodule ClairInspect.Models.Namespace do
  use Ecto.Schema

  schema "namespace" do
    field :name, :string
    field :version_format, :string

    has_many :features, ClairInspect.Models.Features, foreign_key: :namespace_id
    has_many :vulnerabilities, ClairInspect.Models.Vulnerabilities, foreign_key: :namespace_id
  end

end
