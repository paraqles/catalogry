defmodule Catalogry.Repo.Migrations.CreateAddress do
  use Ecto.Migration

  def change do
    create table(:adresses) do
      add :street, :string
      add :number, :string
      add :town, :string
      add :town_number, :string
      add :state, :string

      add :main, :boolean, default: false, null: false

      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:adresses, [:user_id])

  end
end
