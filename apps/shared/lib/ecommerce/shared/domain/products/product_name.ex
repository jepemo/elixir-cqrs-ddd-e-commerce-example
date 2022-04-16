defmodule Ecommerce.Shared.Domain.Products.ProductName do
  defstruct value: nil

  alias Ecommerce.Shared.Domain.ValueObject.String

  @type t :: %__MODULE__{
    value: String.t()
  }

  def new(value) do
    %__MODULE__{value: String.new(value)}
  end
end
