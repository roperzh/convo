use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :convo, Convo.Endpoint,
  http: [port: 4001],
  server: false

config :convo, :http, Convo.Mocks.HTTP
# config :convo, :http, HTTPoison

# Print only warnings and errors during test
config :logger, level: :warn

# Import environment specific config secret file
# which should be versioned separately.
import_config "#{Mix.env}.secret.exs"
