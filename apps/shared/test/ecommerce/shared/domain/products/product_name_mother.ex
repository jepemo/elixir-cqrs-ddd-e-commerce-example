defmodule Ecommerce.Shared.Test.Domain.Products.ProductNameMother do
  alias Ecommerce.Shared.Domain.Products.ProductName

  def new() do
    ProductName.new("Product name #{Enum.random(0..1000)}")
  end
end
