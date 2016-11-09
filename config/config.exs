# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :convo, Convo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3eVj/HLlvsYezBxJbLq8Nx4gk7mpabTybl/eNJjO5W4cKoY1VR5xDympIlHgII22",
  render_errors: [view: Convo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Convo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Import environment specific config secret file
# which should be versioned separately.
import_config "#{Mix.env}.secret.exs"
