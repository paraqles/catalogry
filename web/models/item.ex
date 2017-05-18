defmodule Catalogry.Item do
  use Catalogry.Web, :model

  schema "items" do
    field :name, :string
    field :inventory_number, :integer
    field :state, :string
    field :possessor, :string
    field :return_date, Ecto.DateTime

    belongs_to :inventory, Catalogry.Inventory

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :inventory_number, :state, :possessor, :return_date])
    |> validate_required([:name, :inventory_number, :state, :possessor, :return_date])
  end
end
