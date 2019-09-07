# ClairInspect

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


docker run --name db -p 5431:5432 arminc/clair-db3
docker run -p 6060:6060 --link db:postgres --name clair arminc/clair-local-scan
ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+' 
./clair-scanner_linux_amd64 -c="http://127.0.0.1:6060" --ip="172.17.0.1" nginx:latest