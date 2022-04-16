defmodule Ecommerce.Shared.Test.Domain.Products.ProductIdMother do
  alias Ecommerce.Shared.Domain.Products.ProductId
  alias Ecommerce.Shared.Domain.ValueObject.Uuid

  def new() do
    ProductId.new(Uuid.random_value())
  end
end
