defmodule Catalogry.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :inventory_number, :integer
      add :state, :string
      add :possessor, :string
      add :return_date, :utc_datetime
      add :inventory_id, references(:inventories, on_delete: :nothing)

      timestamps()
    end
    create index(:items, [:inventory_id])

  end
end
