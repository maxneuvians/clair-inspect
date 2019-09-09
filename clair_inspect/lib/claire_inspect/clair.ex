defmodule ClairInspect.Clair.Messages do
  use Protobuf, from: [Path.expand("proto/timestamp.proto", __DIR__),Path.expand("proto/clair.proto", __DIR__)]
end
