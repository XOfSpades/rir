defmodule Rir.Mixfile do
  use Mix.Project

  def project do
    [app: :rir,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Rir, []},
     applications: applications(Mix.env)]
  end

  defp applications(:dev), do: applications(:all) ++ [:remix]
  defp applications(_all), do: [:phoenix, :phoenix_html, :cowboy, :logger,
                                :phoenix_ecto, :postgrex]

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.2"},
     {:phoenix_ecto, "~> 3.0"},
     {:postgrex, "~> 0.11.2"},
     {:phoenix_html, "~> 2.6.2"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:cowboy, "~> 1.0.4"},
     {:comeonin, "~> 1.2"},
     {:remix, "~> 0.0.1", only: :dev}
    ]
  end
end
