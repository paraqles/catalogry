defmodule Catalogry.ItemController do
  use Catalogry.Web, :controller

  require Logger

  alias Catalogry.Item
  alias Catalogry.Inventory

  alias Ecto

  def show(conn, %{"id" => item_id}) do
    item = Repo.get!(Item, item_id)

    render conn, "show.html", item: item
  end

  def new(conn, %{"inventory_id" => inventory_id}) do
    inventory = Repo.get!(Inventory, inventory_id)
    item = inventory
      |> build_assoc(:items)
      |> Item.changeset()

    render conn, "new.html", item: item, inventory: inventory
  end

  def create(conn, %{"inventory_id" => inventory_id, "item" => item_params}) do
    inventory = Repo.get!(Inventory, inventory_id)
      |> Repo.preload(:items)

    changeset = Item.changeset(%Item{}, item_params)
                |> Ecto.Changeset.change(inventory_id: inventory.id)

    Logger.debug "changeset: #{inspect(changeset)}"

    case Repo.insert(changeset) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item created!")
        |> redirect(to: inventory_item_path(conn, :show, inventory, item))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Check your inputs!")
        |> render("new.html", item: changeset, inventory: inventory)
    end
  end

end

