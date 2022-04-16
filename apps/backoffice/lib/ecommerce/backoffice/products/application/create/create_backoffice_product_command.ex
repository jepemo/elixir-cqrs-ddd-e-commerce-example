defmodule Ecommerce.Backoffice.Application.Create.CreateBackofficeProductCommand do
  defstruct id: nil, name: nil, quantity: nil

  @type t :: %__MODULE__ {
    id: String.t(),
    name: String.t(),
    quantity: String.t()
  }

  @spec new(String.t(), String.t(), String.t()) :: t()
  def new(id, name, quantity) do
    %__MODULE__{id: id, name: name, quantity: quantity}
  end
end
