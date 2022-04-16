defmodule Ecommerce.Backoffice.Products.Domain.BackofficeProductQuantity do
  defstruct value: nil

  alias Ecommerce.Shared.Domain.ValueObject.Integer

  @type t :: %__MODULE__{
    value: Integer.t()
  }

  def new(value) do
    %__MODULE__{
      value: Integer.new(value)
    }
  end
end
