defmodule Catalogry.Session do
  use Catalogry.Web, :model

  schema "sessions" do
    field :timeout, :integer
    belongs_to :user, Catalogry.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:timeout])
    |> validate_required([:timeout])
    |> assoc_constraint(:user)
  end
end
