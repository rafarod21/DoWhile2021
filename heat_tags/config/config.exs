# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :heat_tags,
  ecto_repos: [HeatTags.Repo]

# Configures the endpoint
config :heat_tags, HeatTagsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zaHM7TSTPzCA5CgnumdHk6s5r6wsKt4eJDPtciAr//vOM5b9dwO/a4TelJqWd6uZ",
  render_errors: [view: HeatTagsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: HeatTags.PubSub,
  live_view: [signing_salt: "xbr4E2FO"]

config :heat_tags, HeatTags.Scheduler, jobs: [
  # {"0 0 * * *",      {HeatTags.Tags.Count, :call, []}}, -> midnight
  {"* * * * *",      {HeatTags.Tags.Count, :call, []}},
]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
