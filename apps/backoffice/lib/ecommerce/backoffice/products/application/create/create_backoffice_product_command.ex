defmodule Ecommerce.Backoffice.Products.Application.Create.CreateBackofficeProductCommand do
  use Ecommerce.Shared.Domain.Bus.Command.Command,
    [:id, :name, :quantity]

    def new(id, name, quantity) do
      %__MODULE__{id: id, name: name, quantity: quantity}
    end
end
