defmodule Ecommerce.Shared.Test.Infrastructure.Bus.Event.InMemoryEventBus do
  @behaviour Ecommerce.Shared.Domain.Bus.Event.EventBus

  alias Ecommerce.Shared.Domain.Bus.Event.DomainEvent

  @impl
  def publish(events) when is_list(events) do
    events |> Enum.each(&publish/1)
  end

  def publish(%DomainEvent{} = event) do
    IO.inspect(event)
    :ok
  end
end
