defmodule Catalogry.PossessingCommentTest do
  use Catalogry.ModelCase

  alias Catalogry.PossessingComment

  @valid_attrs %{comment: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PossessingComment.changeset(%PossessingComment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PossessingComment.changeset(%PossessingComment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
