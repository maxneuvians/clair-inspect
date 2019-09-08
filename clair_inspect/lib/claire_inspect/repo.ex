defmodule ClairInspect.Repo do
  use Ecto.Repo,
    otp_app: :clair_inspect,
    adapter: Ecto.Adapters.Postgres
end
