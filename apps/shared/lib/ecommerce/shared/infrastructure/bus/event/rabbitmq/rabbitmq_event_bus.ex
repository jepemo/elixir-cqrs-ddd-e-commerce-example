defmodule Ecommerce.Shared.Infrastructure.Bus.Event.RabbitMQ.RabbitMQEventBus do
  @behaviour Ecommerce.Shared.Domain.Bus.Event.EventBus

  @impl
  def publish(events) do
    :ok
  end
end
