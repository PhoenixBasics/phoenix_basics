use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_basics, BasicsWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_basics, Basics.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "phoenix_basics_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :phoenix_basics, BasicsWeb.Guardian.Tokenizer,
  issuer: "phoenix_basics",
  secret_key: "x"

config :arc, bucket: "fawkesapp-test"

import_config "test.secret.exs"
