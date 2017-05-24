defmodule Catalogry.Possessing do
  use Catalogry.Web, :model

  schema "possessings" do
    field :return_date, Ecto.DateTime
    field :returned, :boolean, default: false

    belongs_to :item, Catalogry.Item
    belongs_to :possessor, Catalogry.User
    belongs_to :renter, Catalogry.User

    has_many :comments, Catalogry.PossessingComment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:return_date, :returned])
    |> validate_required([:return_date, :returned])
  end
end
