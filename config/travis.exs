use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :concertrip, Concertrip.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :concertrip, Concertrip.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "concertrip_test",
  ownership_timeout: 600_000,
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
