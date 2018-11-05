defmodule Catalogry.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string

      timestamps()
    end

    create index(:groups, [:id])
  end
end
