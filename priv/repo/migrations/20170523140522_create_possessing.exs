defmodule Catalogry.Repo.Migrations.CreatePossessing do
  use Ecto.Migration

  def change do
    create table(:possessings) do
      add :return_date, :utc_datetime
      add :returned, :boolean, default: false, null: false

      add :item_id, references(:items, on_delete: :delete_all)
      add :possessor_id, references(:users, on_delete: :nothing)
      add :renter_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:possessings, [:item_id])
    create index(:possessings, [:possessor_id])
    create index(:possessings, [:renter_id])

  end
end
