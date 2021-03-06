use Mix.Config

config :comeonin,
  crypto_mod: :bcrypt,
  bcrypt_log_rounds: 15,
  pbkdf2_rounds: 123_000


# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :rir, Rir.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  cache_static_lookup: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch"]]

# Watch static and templates for browser reloading.
config :rir, Rir.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Configure your database
config :rir, Rir.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "rir",
  password: "123#rir#456",
  database: "rir_dev",
  pool_size: 10 # The amount of database connections in the pool
