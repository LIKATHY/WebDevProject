# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mangalike,
  ecto_repos: [Mangalike.Repo]

# Configures the endpoint
config :mangalike, MangalikeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "axEzQsTxogn1iFYyztCkiy8wK4ktyXHtIgqlBaDYaZnuT1a8avrL3mQAauD0gz95",
  render_errors: [view: MangalikeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Mangalike.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
