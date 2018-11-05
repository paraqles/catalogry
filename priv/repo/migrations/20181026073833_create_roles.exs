defmodule Catalogry.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :name, :string
      add :object, :integer
      add :object_type, :string
      add :inhabitant, :integer
      add :inhabitant_type, :string

      timestamps()
    end

  end
end
