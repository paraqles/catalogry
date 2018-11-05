defmodule Catalogry.AccountsTest do
  use Catalogry.DataCase

  alias Catalogry.Accounts

  describe "authenticators" do
    alias Catalogry.Accounts.Authenticator

    @valid_attrs %{authentication_data: "some authentication_data", authentication_type: "some authentication_type", name: "some name"}
    @update_attrs %{authentication_data: "some updated authentication_data", authentication_type: "some updated authentication_type", name: "some updated name"}
    @invalid_attrs %{authentication_data: nil, authentication_type: nil, name: nil}

    def authenticator_fixture(attrs \\ %{}) do
      {:ok, authenticator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_authenticator()

      authenticator
    end

    test "list_authenticators/0 returns all authenticators" do
      authenticator = authenticator_fixture()
      assert Accounts.list_authenticators() == [authenticator]
    end

    test "get_authenticator!/1 returns the authenticator with given id" do
      authenticator = authenticator_fixture()
      assert Accounts.get_authenticator!(authenticator.id) == authenticator
    end

    test "create_authenticator/1 with valid data creates a authenticator" do
      assert {:ok, %Authenticator{} = authenticator} = Accounts.create_authenticator(@valid_attrs)
      assert authenticator.authentication_data == "some authentication_data"
      assert authenticator.authentication_type == "some authentication_type"
      assert authenticator.name == "some name"
    end

    test "create_authenticator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_authenticator(@invalid_attrs)
    end

    test "update_authenticator/2 with valid data updates the authenticator" do
      authenticator = authenticator_fixture()
      assert {:ok, authenticator} = Accounts.update_authenticator(authenticator, @update_attrs)
      assert %Authenticator{} = authenticator
      assert authenticator.authentication_data == "some updated authentication_data"
      assert authenticator.authentication_type == "some updated authentication_type"
      assert authenticator.name == "some updated name"
    end

    test "update_authenticator/2 with invalid data returns error changeset" do
      authenticator = authenticator_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_authenticator(authenticator, @invalid_attrs)
      assert authenticator == Accounts.get_authenticator!(authenticator.id)
    end

    test "delete_authenticator/1 deletes the authenticator" do
      authenticator = authenticator_fixture()
      assert {:ok, %Authenticator{}} = Accounts.delete_authenticator(authenticator)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_authenticator!(authenticator.id) end
    end

    test "change_authenticator/1 returns a authenticator changeset" do
      authenticator = authenticator_fixture()
      assert %Ecto.Changeset{} = Accounts.change_authenticator(authenticator)
    end
  end
end
