defmodule Catalogry.Repo.Migrations.CreateGroupMemberships do
  use Ecto.Migration

  def change do
    create table(:group_memberships, primary_key: false) do
      add :group_id, references(:groups, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:group_memberships, [:group_id])
    create index(:group_memberships, [:user_id])
    create unique_index(:group_memberships, [:group_id, :user_id])
  end
end
