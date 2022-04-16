defmodule Ecommerce.Shared.Domain.ValueObject.String do
  defstruct value: nil

  @type t :: %__MODULE__{
    value: String.t()
  }

  @spec new(String.t()) :: t()
  def new(value) when is_bitstring(value) do
    %__MODULE__{
      value: value
    }
  end

  def new(value) do
    raise ArgumentError, message: "#{value} is not a valid string value"
  end
end
