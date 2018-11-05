defmodule Catalogry.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :surname, :string
      add :email, :string

      timestamps()
    end

  end
end
