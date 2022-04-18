# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :shared, Ecommerce.Shared.Repo,
  database: "shared_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :shared,
  ecto_repos: [Ecommerce.Shared.Repo]

config :store,
  ecto_repos: [Ecommerce.Shared.Repo]

config :backoffice,
  ecto_repos: [Ecommerce.Shared.Repo]

config :backoffice_front,
  namespace: Ecommerce.Backoffice.Front

# Configures the endpoint
config :backoffice_front, Ecommerce.Backoffice.FrontWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    view: Ecommerce.Backoffice.FrontWeb.ErrorView,
    accepts: ~w(html json),
    layout: false
  ],
  pubsub_server: Ecommerce.Backoffice.Front.PubSub,
  live_view: [signing_salt: "c2oOerbh"]

config :store_front,
  namespace: Ecommerce.Store.Front

# Configures the endpoint
config :store_front, Ecommerce.Store.FrontWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: Ecommerce.Store.FrontWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Ecommerce.Store.Front.PubSub,
  live_view: [signing_salt: "u4wplz4M"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  backoffice: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/backoffice_front/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ],
  store: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/backoffice_front/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

# DI
config :backoffice,
       :product_repository,
       Ecommerce.Backoffice.Products.Infrastructure.Persistence.EctoBackofficeProductRepository

config :backoffice,
       :event_bus,
       Ecommerce.Shared.Infrastructure.Bus.Event.RabbitMQ.RabbitMQEventBus

config :backoffice,
       :command_bus,
       Ecommerce.Shared.Test.Infrastructure.Bus.Command.InMemoryCommandBus

config :backoffice,
       :in_memory_command_bus_deps,
       [
         {Ecommerce.Backoffice.Products.Application.Create.CreateBackofficeProductCommand,
          Ecommerce.Backoffice.Products.Application.Create.CreateBackofficeProductCommandHandler}
       ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
