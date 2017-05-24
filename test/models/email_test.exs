defmodule Catalogry.EmailTest do
  use Catalogry.ModelCase

  alias Catalogry.Email

  @valid_attrs %{active: true, email_address: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Email.changeset(%Email{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Email.changeset(%Email{}, @invalid_attrs)
    refute changeset.valid?
  end
end
