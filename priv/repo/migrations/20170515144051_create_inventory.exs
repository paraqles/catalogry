defmodule Catalogry.Repo.Migrations.CreateInventory do
  use Ecto.Migration

  def change do
    create table(:inventories) do
      add :name, :string

      timestamps()
    end

  end
end
