defmodule Catalogry.Repo.Migrations.CreatePossessingComment do
  use Ecto.Migration

  def change do
    create table(:possessing_comments) do
      add :comment, :string
      add :creator_id, references(:users, on_delete: :nothing)
      add :possessing_id, references(:possessings, on_delete: :nothing)

      timestamps()
    end
    create index(:possessing_comments, [:creator_id])
    create index(:possessing_comments, [:possessing_id])

  end
end
