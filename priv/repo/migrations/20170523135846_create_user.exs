defmodule Catalogry.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :login_name, :string

      timestamps()
    end

  end
end
