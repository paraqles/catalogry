defmodule Catalogry.Email do
  use Catalogry.Web, :model

  schema "emails" do
    field :email_address, :string
    field :active, :boolean, default: false
    belongs_to :user, Catalogry.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email_address, :active])
    |> validate_required([:email_address, :active])
  end
end
