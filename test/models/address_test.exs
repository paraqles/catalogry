defmodule Catalogry.AddressTest do
  use Catalogry.ModelCase

  alias Catalogry.Address

  @valid_attrs %{main: true, number: "some content", state: "some content", state_number: "some content", street: "some content", town: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Address.changeset(%Address{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Address.changeset(%Address{}, @invalid_attrs)
    refute changeset.valid?
  end
end
