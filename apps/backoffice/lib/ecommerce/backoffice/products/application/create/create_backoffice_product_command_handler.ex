defmodule Ecommerce.Backoffice.Application.Create.CreateBackofficeProductCommandHandler do
  alias Ecommerce.Backoffice.Application.Create.CreateBackofficeProductCommand
  alias Ecommerce.Backoffice.Products.Application.Create.BackofficeProductCreator
  alias Ecommerce.Backoffice.Products.Domain.BackofficeProductQuantity
  alias Ecommerce.Shared.Domain.Products.ProductId
  alias Ecommerce.Shared.Domain.Products.ProductName


  @spec handle(CreateBackofficeProductCommand.t()) :: :ok | {:error, String.t()}
  def handle(command) do
    id = ProductId.new(command.id)
    name = ProductName.new(command.name)
    quantity = BackofficeProductQuantity.new(command.quantity)

    BackofficeProductCreator.create(id, name, quantity)
  end
end
