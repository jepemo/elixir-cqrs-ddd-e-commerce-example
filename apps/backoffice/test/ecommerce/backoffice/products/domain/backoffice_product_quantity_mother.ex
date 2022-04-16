defmodule Ecommerce.Backoffice.Test.Products.Domain.BackofficeProductQuantityMother do
  alias Ecommerce.Backoffice.Products.Domain.BackofficeProductQuantity

  def new() do
    BackofficeProductQuantity.new(Enum.random(0..100))
  end
end
