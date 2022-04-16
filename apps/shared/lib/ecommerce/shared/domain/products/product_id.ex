defmodule Ecommerce.Shared.Domain.Products.ProductId do
  defstruct value: nil

  alias Ecommerce.Shared.Domain.ValueObject.Uuid

  @type t :: %__MODULE__{
    value: Uuid.t()
  }

  def new(value) do
    %__MODULE__{value: Uuid.new(value)}
  end
end
