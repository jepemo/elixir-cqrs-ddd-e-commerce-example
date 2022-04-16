defmodule Ecommerce.Backoffice.Products.Infrastructure.Persistence.EctoBackofficeProductSchema do
  use Ecto.Schema
  import Ecto.Changeset

  # @primary_key {:id, :binary_id, autogenerate: true}
  # @foreign_key_type :binary_id
  @primary_key false
  schema "products" do
    field :id, :binary_id
    field :name, :string
    field :quantity, :integer, default: 0
    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:id, :name, :quantity])
    |> validate_required([:id, :name])
  end
end
