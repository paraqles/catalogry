defmodule Catalogry.PossessingComment do
  use Catalogry.Web, :model

  schema "possessing_comments" do
    field :comment, :string

    belongs_to :creator, Catalogry.User
    belongs_to :possessing, Catalogry.Possessing

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:comment])
    |> validate_required([:comment])
  end
end
