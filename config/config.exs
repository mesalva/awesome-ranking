# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :awesome_ranking,
  ecto_repos: [AwesomeRanking.Repo]

# Configures the endpoint
config :awesome_ranking, AwesomeRanking.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dbqW1kr1cXGX6gdGEhCPEt4tTCZ9OEeZScmSAlmqlk+40ywGKbXjPLwj90JXe+EE",
  render_errors: [view: AwesomeRanking.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AwesomeRanking.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
