defmodule Catalogry.ItemController do
  use Catalogry.Web, :controller

  alias Catalogry.Item
  alias Catalogry.Inventory

  def show(conn, %{"id" => item_id}) do
    item = Repo.get!(Item, item_id) |> Repo.preload([:items])

    render conn, "show.html", item: item
  end

  def new(conn, %{"inventory_id" => inventory_id}) do
    inventory = Repo.get!(Inventory, inventory_id)
    item =
      inventory
      |> build_assoc(:items)
      |> Item.changeset()

    render conn, "new.html", item: item, inventory: inventory
  end

  def create(conn, %{"inventory_id" => inventory_id, "item" => item_params}) do
    inventory = Repo.get!(Inventory, inventory_id)
    changeset = Item.changeset(%Item{}, item_params)

    case Repo.insert(changeset) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Inventory created!")
        |> redirect(to: inventory_item_path(conn, :show, inventory, item))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Check your inputs!")
        |> render("new.html", item: changeset, inventory: inventory)
    end
  end

end

