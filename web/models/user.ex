defmodule Catalogry.User do
  use Catalogry.Web, :model

  schema "users" do
    field :name, :string
    field :login_name, :string

    has_many :emails, Catalogry.Email
    has_many :addresses, Catalogry.Address

    has_many :authenticators, Catalogry.Authenticator

    has_many :roles, Catalogry.Role

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :login_name])
    |> validate_required([:name, :login_name])
  end
end
