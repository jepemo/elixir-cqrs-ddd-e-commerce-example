defmodule Ecommerce.Shared.Domain.ValueObject.Integer do
  defstruct value: nil

  @type t :: %__MODULE__{
    value: Integer.t()
  }

  @spec new(Integer.t()) :: t()
  def new(value) when is_integer(value) do
    %__MODULE__{
      value: value
    }
  end

  def new(value) do
    raise ArgumentError, message: "#{value} is not a valid integer value"
  end
end
