defmodule CatalogryWeb.PossessingTest do
  use Catalogry.ModelCase

  alias CatalogryWeb.Possessing

  @valid_attrs %{return_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, returned: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Possessing.changeset(%Possessing{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Possessing.changeset(%Possessing{}, @invalid_attrs)
    refute changeset.valid?
  end
end
