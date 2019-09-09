defmodule ClairInspect.Clair do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://localhost:6060"
  plug Tesla.Middleware.JSON

  def add_layer(url, parent \\ "") do
    name =
      url
      |> String.split("?")
      |> hd()
      |> String.split("/")
      |> Enum.reverse()
      |> hd()

    data = %{
      "Layer": %{
        "Name": name,
        "Path": url,
        "ParentName": parent,
        "Format": "Docker"
      }
    }
    post("/v1/layers", Jason.encode!(data))
  end
end
