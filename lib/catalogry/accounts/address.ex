defmodule Catalogry.Accounts.Address do
  use Ecto.Schema

  import Ecto.Changeset
  alias Catalogry.Accounts.User

  schema "adresses" do
    field :street, :string
    field :number, :string
    field :town, :string
    field :state, :string
    field :state_number, :string

    field :main, :boolean, default: false

    belongs_to :user, User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:street, :number, :town, :state, :state_number, :main])
    |> validate_required([:street, :number, :town, :state, :state_number, :main])
  end
end
