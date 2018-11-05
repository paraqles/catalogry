defmodule Catalogry.Accounts.Authenticator do
  use Ecto.Schema
  import Ecto.Changeset

  alias Catalogry.Accounts.User

  schema "authenticators" do
    field :name, :string
    field :type, :string
    field :data, :string

    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(authenticator, attrs) do
    authenticator
    |> cast(attrs, [:name, :authentication_type, :authentication_data])
    |> validate_required([:name, :authentication_type, :authentication_data])
  end
end
