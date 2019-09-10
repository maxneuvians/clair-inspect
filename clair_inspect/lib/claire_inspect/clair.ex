defmodule ClairInspect.Clair do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://localhost:6060"
  plug Tesla.Middleware.JSON

  def add_layers(repo, layers) when is_list(layers) do
    layers
    |> Enum.reverse()
    |> Enum.reduce("", fn layer, parent ->
      add_layer(repo, layer, parent)
    end)
  end

  defp add_layer(repo, url, parent \\ "") do
    name =
      url
      |> String.split("?")
      |> hd()
      |> String.split("/")
      |> Enum.reverse()
      |> hd()
      |> Kernel.<>(":#{repo}")

    data = %{
      "Layer": %{
        "Name": name,
        "Path": url,
        "ParentName": parent,
        "Format": "Docker"
      }
    }
    post("/v1/layers", Jason.encode!(data))
    name
  end
end
