# General application configuration
use Mix.Config

# Configures the endpoint
config :optimus_prime, OptimusPrimeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OOucVi0nv0e13Ogk57Ci/I3jjIZqiJ+YX29uE4u1jQNYC4r2wswpBaW+PfH4tYPA",
  render_errors: [view: OptimusPrimeWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: OptimusPrime.PubSub,
  live_view: [signing_salt: "aj3TcjNB"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
