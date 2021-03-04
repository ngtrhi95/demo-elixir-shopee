# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ecommerce,
  ecto_repos: [Ecommerce.Repo]

# Configures the endpoint
config :ecommerce, Ecommerce.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eBviKvSCTtpzhTK7HlvLh+n6ZPE6h7aYKK2FXkxES5Qk/+y3y02YeFekSAsXHHc2",
  render_errors: [view: Ecommerce.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ecommerce.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

config :phoenix, :format_encoders,
  "json-api": Poison

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
