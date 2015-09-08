use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :rir, Rir.Endpoint,
  secret_key_base: "some#key"

# Configure your database
config :rir, Rir.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rir_prod",
  size: 20 # The amount of database connections in the pool
