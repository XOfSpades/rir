use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rir, Rir.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rir, Rir.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "rir",
  password: "123#rir#456",
  database: "rir_test",
  pool_size: 1, # Use a single connection for transactional tests
  pool: Ecto.Adapters.SQL.Sandbox

# Improve bcript speed for tests
config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1
