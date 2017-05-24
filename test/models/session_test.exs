defmodule Catalogry.SessionTest do
  use Catalogry.ModelCase

  alias Catalogry.Session

  @valid_attrs %{timeout: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Session.changeset(%Session{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Session.changeset(%Session{}, @invalid_attrs)
    refute changeset.valid?
  end
end
