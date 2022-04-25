defmodule Ecommerce.Backoffice.Products.Application.Create.CreateBackofficeProductCommand do
  use Ecommerce.Shared.Domain.Bus.Command.Command, [
    :id,
    :name,
    :quantity
  ]
end
