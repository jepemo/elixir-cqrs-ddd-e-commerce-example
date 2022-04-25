defmodule Ecommerce.Backoffice.Products.Domain.BackofficeProduct do
  defstruct id: nil, name: nil, quantity: nil

  alias Ecommerce.Backoffice.Products.Domain.{BackofficeProductCreatedDomainEvent, BackofficeProductQuantity}
  alias Ecommerce.Shared.Domain.Products.{ProductId, ProductName}

  @type t :: %__MODULE__{
    id: ProductId.t(),
    name: ProductName.t(),
    quantity: BackofficeProductQuantity.t()
  }

  @spec create(ProductId.t(), ProductName.t(), BackofficeProductQuantity.t()) :: {:ok, t(), list(BackofficeProductCreatedDomainEvent.t())}
  def create(id, name, quantity) do
    product = %__MODULE__{id: id, name: name, quantity: quantity}
    events = [BackofficeProductCreatedDomainEvent.new(to_string(id.value.value))]
    {:ok, product, events}
  end
end
