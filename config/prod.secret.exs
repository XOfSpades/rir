use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :rir, Rir.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
config :rir, Rir.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  # username: System.get_env("DATABASE_USERNAME"),
  # password: System.get_env("DATABASE_PASSWORD"),
  # database: "rir_prod",
  pool_size: 20 # The amount of database connections in the pool
