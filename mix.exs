defmodule Convo.Mixfile do
  use Mix.Project

  def project do
    [
      app: :convo,
      version: "0.0.1",
      elixir: "~> 1.2",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix] ++ Mix.compilers,
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  def application do
    [
      mod: {Convo, []},
      applications: [
        :phoenix,
        :phoenix_pubsub,
        :phoenix_html,
        :cowboy,
        :logger,
        :oauth2
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  defp deps do
    [
      # General dependencies
      {:phoenix, "~> 1.2.1"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_html, "~> 2.6"},
      {:cowboy, "~> 1.0"},
      {:oauth2, "~> 0.8"},
      # Dev depencencies
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:mix_test_watch, "~> 0.2", only: :dev}
    ]
  end
end
