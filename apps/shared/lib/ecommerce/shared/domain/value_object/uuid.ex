defmodule Ecommerce.Shared.Domain.ValueObject.Uuid do
  defstruct value: nil

  @type t :: %__MODULE__{
    value: Ecto.UUID.t()
  }

  @spec new(String.t()) :: t()
  def new(value \\ random_value()) do
    %__MODULE__{
      value: Ecto.UUID.cast!(value)
    }
  end

  @spec random_value() :: String.t()
  def random_value() do
    to_string(Ecto.UUID.generate())
  end
end
