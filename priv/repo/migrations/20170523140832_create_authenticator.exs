defmodule Catalogry.Repo.Migrations.CreateAuthenticator do
  use Ecto.Migration

  def change do
    create table(:authenticators) do
      add :name, :string
      add :type, :string
      add :invalid, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :delete_all)
      add :data, :string

      timestamps()
    end
    create index(:authenticators, [:user_id])

  end
end
