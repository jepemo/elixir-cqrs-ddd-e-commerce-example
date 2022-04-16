defmodule Ecommerce.Store.Front.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Ecommerce.Store.FrontWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ecommerce.Store.Front.PubSub},
      # Start the Endpoint (http/https)
      Ecommerce.Store.FrontWeb.Endpoint
      # Start a worker by calling: Ecommerce.Store.Front.Worker.start_link(arg)
      # {Ecommerce.Store.Front.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ecommerce.Store.Front.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Ecommerce.Store.FrontWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
