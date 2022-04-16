defmodule Ecommerce.Backoffice.Products.Infrastructure.Persistence.EctoBackofficeProductRepository do
  @behaviour Ecommerce.Backoffice.Products.Domain.BackofficeProductRepository

  alias Ecommerce.Shared.Repo
  alias Ecommerce.Backoffice.Products.Infrastructure.Persistence.EctoBackofficeProductSchema

  @impl true
  def save(product) do
    entity = %EctoBackofficeProductSchema{
      id: product.id.value.value,
      name: product.name.value.value,
      quantity: product.quantity.value.value
    }

    case Repo.insert(entity) do
      {:ok, _struct} -> :ok
      {:error, changeset} -> {:error, "Error inserting the product #{inspect(changeset)}"}
    end
  end
end
