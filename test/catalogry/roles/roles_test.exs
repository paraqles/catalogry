defmodule Catalogry.RolesTest do
  use Catalogry.DataCase

  alias Catalogry.Roles

  describe "roles" do
    alias Catalogry.Roles.Role

    @valid_attrs %{inhabitant: 42, inhabitant_type: "some inhabitant_type", name: "some name", object: 42, object_type: "some object_type"}
    @update_attrs %{inhabitant: 43, inhabitant_type: "some updated inhabitant_type", name: "some updated name", object: 43, object_type: "some updated object_type"}
    @invalid_attrs %{inhabitant: nil, inhabitant_type: nil, name: nil, object: nil, object_type: nil}

    def role_fixture(attrs \\ %{}) do
      {:ok, role} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Roles.create_role()

      role
    end

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Roles.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Roles.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      assert {:ok, %Role{} = role} = Roles.create_role(@valid_attrs)
      assert role.inhabitant == 42
      assert role.inhabitant_type == "some inhabitant_type"
      assert role.name == "some name"
      assert role.object == 42
      assert role.object_type == "some object_type"
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Roles.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      assert {:ok, role} = Roles.update_role(role, @update_attrs)
      assert %Role{} = role
      assert role.inhabitant == 43
      assert role.inhabitant_type == "some updated inhabitant_type"
      assert role.name == "some updated name"
      assert role.object == 43
      assert role.object_type == "some updated object_type"
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Roles.update_role(role, @invalid_attrs)
      assert role == Roles.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Roles.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Roles.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Roles.change_role(role)
    end
  end

  describe "groups" do
    alias Catalogry.Roles.Group

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def group_fixture(attrs \\ %{}) do
      {:ok, group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Roles.create_group()

      group
    end

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Roles.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Roles.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = Roles.create_group(@valid_attrs)
      assert group.name == "some name"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Roles.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      assert {:ok, group} = Roles.update_group(group, @update_attrs)
      assert %Group{} = group
      assert group.name == "some updated name"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Roles.update_group(group, @invalid_attrs)
      assert group == Roles.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Roles.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Roles.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Roles.change_group(group)
    end
  end

  describe "memberships" do
    alias Catalogry.Roles.Membership

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def membership_fixture(attrs \\ %{}) do
      {:ok, membership} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Roles.create_membership()

      membership
    end

    test "list_memberships/0 returns all memberships" do
      membership = membership_fixture()
      assert Roles.list_memberships() == [membership]
    end

    test "get_membership!/1 returns the membership with given id" do
      membership = membership_fixture()
      assert Roles.get_membership!(membership.id) == membership
    end

    test "create_membership/1 with valid data creates a membership" do
      assert {:ok, %Membership{} = membership} = Roles.create_membership(@valid_attrs)
    end

    test "create_membership/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Roles.create_membership(@invalid_attrs)
    end

    test "update_membership/2 with valid data updates the membership" do
      membership = membership_fixture()
      assert {:ok, membership} = Roles.update_membership(membership, @update_attrs)
      assert %Membership{} = membership
    end

    test "update_membership/2 with invalid data returns error changeset" do
      membership = membership_fixture()
      assert {:error, %Ecto.Changeset{}} = Roles.update_membership(membership, @invalid_attrs)
      assert membership == Roles.get_membership!(membership.id)
    end

    test "delete_membership/1 deletes the membership" do
      membership = membership_fixture()
      assert {:ok, %Membership{}} = Roles.delete_membership(membership)
      assert_raise Ecto.NoResultsError, fn -> Roles.get_membership!(membership.id) end
    end

    test "change_membership/1 returns a membership changeset" do
      membership = membership_fixture()
      assert %Ecto.Changeset{} = Roles.change_membership(membership)
    end
  end
end
