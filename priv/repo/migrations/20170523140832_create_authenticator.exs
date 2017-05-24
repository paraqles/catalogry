defmodule Catalogry.Repo.Migrations.CreateAuthenticator do
  use Ecto.Migration

  def change do
    create table(:authenticators) do
      add :secret, :string
      add :type, :string
      add :invalid, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:authenticators, [:user_id])

  end
end
