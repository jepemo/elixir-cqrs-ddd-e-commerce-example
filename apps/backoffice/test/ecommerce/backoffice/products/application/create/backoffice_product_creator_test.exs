defmodule Ecommerce.Backoffice.Test.Products.Application.Create.BackofficeProductCreator do
  use ExUnit.Case

  alias Ecommerce.Backoffice.Products.Application.Create.BackofficeProductCreator
  alias Ecommerce.Shared.Test.Domain.Products.ProductIdMother
  alias Ecommerce.Shared.Test.Domain.Products.ProductNameMother
  alias Ecommerce.Backoffice.Test.Products.Domain.BackofficeProductQuantityMother

  test "should create a product" do

    id = ProductIdMother.new()
    name = ProductNameMother.new()
    quantity = BackofficeProductQuantityMother.new()

    assert BackofficeProductCreator.create(id, name, quantity) == :ok

  end
end
