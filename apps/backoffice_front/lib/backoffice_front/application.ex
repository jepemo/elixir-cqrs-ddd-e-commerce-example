defmodule Ecommerce.Backoffice.Front.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Ecommerce.Backoffice.FrontWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ecommerce.Backoffice.Front.PubSub},
      # Start the Endpoint (http/https)
      Ecommerce.Backoffice.FrontWeb.Endpoint
      # Start a worker by calling: Ecommerce.Backoffice.Front.Worker.start_link(arg)
      # {Ecommerce.Backoffice.Front.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ecommerce.Backoffice.Front.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Ecommerce.Backoffice.FrontWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
