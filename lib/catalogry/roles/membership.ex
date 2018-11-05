defmodule Catalogry.Roles.GroupMembership do
  use Ecto.Schema
  import Ecto.Changeset


  schema "memberships" do
    belongs_to :group, Group
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(membership, attrs) do
    membership
    |> cast(attrs, [:group_id, :user_id])
    |> validate_required([:group_id, :user_id])
  end
end
