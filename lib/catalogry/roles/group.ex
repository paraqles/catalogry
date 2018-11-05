defmodule Catalogry.Roles.Group do
  use Ecto.Schema
  import Ecto.Changeset

  alias Catalogry.Accounts.User

  schema "groups" do
    field :name, :string

    many_to_many :members, User,
      join_through: GroupMembership,
      join_keys: [group_id: :id, user_id: :id]

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
