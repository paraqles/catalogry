defmodule Catalogry.Accounts.Session do
  use Ecto.Schema

  import Ecto.Changeset
  alias Catalogry.Accounts.User

  schema "sessions" do
    field :timeout, :integer
    field :location, :string

    belongs_to :user, User
    has_one :authenticator, Authenticator

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
