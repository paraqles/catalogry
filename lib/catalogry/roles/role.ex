defmodule Catalogry.Roles.Role do
  use Ecto.Schema
  import Ecto.Changeset


  schema "roles" do
    field :inhabitant, :integer
    field :inhabitant_type, :string
    field :name, :string
    field :object, :integer
    field :object_type, :string

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name, :object, :object_type, :inhabitant, :inhabitant_type])
    |> validate_required([:name, :object, :object_type, :inhabitant, :inhabitant_type])
  end
end
