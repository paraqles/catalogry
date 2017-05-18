# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :catalogry,
  ecto_repos: [Catalogry.Repo]

# Configures the endpoint
config :catalogry, Catalogry.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/iPqHbHtkwEGZGZ2u7pmEjInC55fphiobotibhycc1fgs/mLoLmtSsyUgYCPOtJ+",
  render_errors: [view: Catalogry.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Catalogry.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
