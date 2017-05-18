defmodule Catalogry.InventoryTest do
  use Catalogry.ModelCase

  alias Catalogry.Inventory

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Inventory.changeset(%Inventory{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Inventory.changeset(%Inventory{}, @invalid_attrs)
    refute changeset.valid?
  end
end
