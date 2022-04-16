defmodule Ecommerce.Shared.Domain.Bus.Event.DomainEvent do
  defstruct event_id: nil, ocurred_on: nil, aggregate_id: nil

  alias Ecommerce.Shared.Domain.ValueObject.Uuid

  @type t :: %__MODULE__{
    event_id: String.t(),
    ocurred_on: DateTime.t(),
    aggregate_id: String.t()
  }

  @spec new(String.t(), String.t(), DateTime.t()) :: t()
  def new(aggregate_id, event_id \\ Uuid.random_value(), ocurred_on \\ DateTime.utc_now()) do
    %__MODULE__{
      event_id: event_id,
      ocurred_on: ocurred_on,
      aggregate_id: aggregate_id
    }
  end
end
