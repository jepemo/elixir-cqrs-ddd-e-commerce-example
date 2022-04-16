defmodule Ecommerce.Backoffice.Products.Domain.BackofficeProduct do
  defstruct id: nil, name: nil, quantity: nil

  alias Ecommerce.Backoffice.Products.Domain.BackofficeProductQuantity
  alias Ecommerce.Shared.Domain.Bus.Event.DomainEvent
  alias Ecommerce.Shared.Domain.Products.ProductId
  alias Ecommerce.Shared.Domain.Products.ProductName

  @type t :: %__MODULE__{
    id: ProductId.t(),
    name: ProductName.t(),
    quantity: BackofficeProductQuantity.t()
  }

  @spec create(ProductId.t(), ProductName.t(), BackofficeProductQuantity.t()) :: {:ok, t(), list(DomainEvent.t())}
  def create(id, name, quantity) do
    product = %__MODULE__{id: id, name: name, quantity: quantity}
    events = [DomainEvent.new(to_string(id.value.value))]
    {:ok, product, events}
  end
end
