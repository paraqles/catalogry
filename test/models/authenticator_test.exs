defmodule Catalogry.AuthenticatorTest do
  use Catalogry.ModelCase

  alias Catalogry.Authenticator

  @valid_attrs %{invalid: true, secret: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Authenticator.changeset(%Authenticator{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Authenticator.changeset(%Authenticator{}, @invalid_attrs)
    refute changeset.valid?
  end
end
