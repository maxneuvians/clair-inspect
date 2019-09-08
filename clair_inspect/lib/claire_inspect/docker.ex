defmodule ClairInspect.Docker do

  def catalog() do
    client()
    |> login("registry:catalog:*")
    |> get("/v2/_catalog")
  end

  def blob(repository, digest) do
    client()
    |> login("repository:" <> repository <> ":*")
    |> get("/v2/" <> repository <> "/blobs/" <> digest)
  end

  # Returns the layer URLs from newest to oldest
  def layers(repository, tag \\ "latest") do
    layers =
      manifest(repository, tag)
      |> Map.get("fsLayers")
      |> Stream.uniq
      |> Stream.map(fn x -> x["blobSum"] end)
      |> Stream.map(&blob(repository, &1))
      |> Enum.filter(&String.starts_with?(&1, "https://"))
  end

  def manifest(repository, tag) do
    client()
    |> login("repository:" <> repository <> ":*")
    |> get("/v2/" <> repository <> "/manifests/" <> tag)
    |> Jason.decode!()
  end

  defp client do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://gcr.io"},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers, [{"authorization", "Basic " <> get_basic_token() }]}
    ]
    Tesla.client(middleware)
  end

  defp get(client, url) do
    case Tesla.get(client, url) do
      {:ok, %{status: 200, body: body}} ->
        body
      {:ok, %{status: 302, headers: headers}} ->
        Enum.into(headers, %{})
        |> Map.get("location")
      _ ->
        {:error, "There was an error getting the docker token"}
    end
  end

  defp get_basic_token() do
    username = "_json_key"
    password = "gcp.json" |> File.read!()
    "#{username}:#{password}"
      |> Base.encode64()
  end

  defp login(client, scope) do
    case Tesla.get(client, "/v2/token", query: [service: "gcr.io", scope: scope]) do
      {:ok, %{body: body}} ->
        middleware = [
          {Tesla.Middleware.BaseUrl, "https://gcr.io"},
          Tesla.Middleware.JSON,
          {Tesla.Middleware.Headers, [{"authorization", "Bearer " <> body["token"] }]}
        ]
        Tesla.client(middleware)
      _ ->
        {:error, "There was an error getting the docker token"}
    end
  end
end
