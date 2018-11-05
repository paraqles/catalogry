defmodule Catalogry.Accounts.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Catalogry.Accounts.{ Address, Authenticator, Session }
  alias Catalogry.Roles.{ GroupMembership, Group }

  schema "users" do
    field :name, :string
    field :surname, :string
    field :email, :string

    has_many :addresses, Address
    has_many :authenticators, Authenticator
    has_many :sessions, Session

    many_to_many :groups, join_through: GroupMembership

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :surname, :email])
    |> validate_required([:name, :email])
  end
end
