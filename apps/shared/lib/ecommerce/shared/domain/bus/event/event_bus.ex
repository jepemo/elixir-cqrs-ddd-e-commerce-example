defmodule Ecommerce.Shared.Domain.Bus.Event.EventBus do
  alias Ecommerce.Shared.Domain.Bus.Event.DomainEvent
  @callback publish(list(DomainEvent.t())) :: none()
end
