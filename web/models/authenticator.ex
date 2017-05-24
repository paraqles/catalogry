defmodule Catalogry.Authenticator do
  use Catalogry.Web, :model

  schema "authenticators" do
    field :secret, :string
    field :type, :string
    field :invalid, :boolean, default: false
    belongs_to :user, Catalogry.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:secret, :invalid])
    |> validate_required([:secret, :invalid])
  end
end
