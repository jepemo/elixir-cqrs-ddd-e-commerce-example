defmodule Ecommerce.Backoffice.Products.Domain.BackofficeProductRepository do
  alias Ecommerce.Backoffice.Products.Domain.BackofficeProduct

  @doc """
  """
  @callback save(BackofficeProduct.t()) :: :ok | {:error, String.t()}
end
