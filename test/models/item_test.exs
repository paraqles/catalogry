defmodule Catalogry.ItemTest do
  use Catalogry.ModelCase

  alias Catalogry.Item

  @valid_attrs %{inventory_number: 42, name: "some content", possessor: "some content", return_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, state: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Item.changeset(%Item{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Item.changeset(%Item{}, @invalid_attrs)
    refute changeset.valid?
  end
end
