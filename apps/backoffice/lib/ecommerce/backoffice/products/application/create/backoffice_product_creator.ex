defmodule Ecommerce.Backoffice.Products.Application.Create.BackofficeProductCreator do
  alias Ecommerce.Backoffice.Products.Domain.BackofficeProduct
  alias Ecommerce.Backoffice.Products.Domain.BackofficeProductQuantity
  alias Ecommerce.Backoffice.Products.Domain.BackofficeProductRepository
  alias Ecommerce.Shared.Domain.Bus.Event.EventBus
  alias Ecommerce.Shared.Domain.Products.ProductId
  alias Ecommerce.Shared.Domain.Products.ProductName

  @spec create(ProductId.t(), ProductName.t(), BackofficeProductQuantity.t()) :: :ok | {:error, String.t()}
  def create(id, name, quantity) do
    with {:ok, product, events} <- BackofficeProduct.create(id, name, quantity),
      :ok <- repository().save(product),
      :ok <- event_bus().publish(events) do
      :ok
    end
  end

  @spec repository() :: BackofficeProductRepository.t()
  defp repository() do
    Application.get_env(:backoffice, :product_repository)
  end

  @spec event_bus() :: EventBus.t()
  def event_bus() do
    Application.get_env(:backoffice, :event_bus)
  end
end
