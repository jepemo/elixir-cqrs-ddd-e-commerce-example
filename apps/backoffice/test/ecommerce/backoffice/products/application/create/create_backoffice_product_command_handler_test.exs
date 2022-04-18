defmodule Ecommerce.Backoffice.Test.Products.Application.Create.CreateBackofficeProductCommandHandler do
  use ExUnit.Case

  alias Ecommerce.Backoffice.Products.Application.Create.CreateBackofficeProductCommand
  alias Ecommerce.Shared.Domain.ValueObject.Uuid

  test "should create a product" do
    CreateBackofficeProductCommand.new(Uuid.random_value(), "name1", "10")
    |> command_bus().dispatch()
    |> (&(assert &1 == :ok)).()
  end

  defp command_bus() do
    Application.get_env(:backoffice, :command_bus)
  end
end
