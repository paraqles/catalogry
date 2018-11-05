defmodule Catalogry.Item do
  use Catalogry.Web, :model

  schema "items" do
    field :name, :string
    field :inventory_number, :integer
    field :state, :string

    belongs_to :inventory, Catalogry.Inventory
    has_many :possessings, Catalogry.Possessing

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :inventory_number, :state])
    |> validate_required([:name, :state])
  end
end
