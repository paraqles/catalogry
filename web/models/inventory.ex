defmodule Catalogry.Inventory do
  use Catalogry.Web, :model

  schema "inventories" do
    field :name, :string

    has_many :items, Catalogry.Item
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
