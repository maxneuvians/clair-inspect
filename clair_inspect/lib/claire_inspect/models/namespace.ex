defmodule ClairInspect.Models.Namespace do
  use Ecto.Schema

  schema "namespace" do
    field :name, :string
    field :version_format, :string

    has_many :features, ClairInspect.Models.Feature, foreign_key: :namespace_id
    has_many :vulnerabilities, ClairInspect.Models.Vulnerability, foreign_key: :namespace_id
  end

end
