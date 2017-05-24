defmodule Catalogry.Repo.Migrations.CreateAddress do
  use Ecto.Migration

  def change do
    create table(:adresses) do
      add :street, :string
      add :number, :string
      add :town, :string
      add :state, :string
      add :state_number, :string
      add :main, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:adresses, [:user_id])

  end
end
