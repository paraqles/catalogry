defmodule Catalogry.InventoryController do
  use Catalogry.Web, :controller

  alias Catalogry.Inventory

  def index(conn, _params) do
    inventories = Repo.all(Inventory)
    render conn, "index.html", inventories: inventories
  end

  def show(conn, %{"id" => inventory_id}) do
    inventory = Repo.get!(Inventory, inventory_id) |> Repo.preload([:items])

    render conn, "show.html", inventory: inventory
  end

  def new(conn, _params) do
    inventory = Inventory.changeset(%Inventory{})
    render conn, "new.html", inventory: inventory
  end

  def create(conn, %{"inventory" => inventory_params}) do
    changeset = Inventory.changeset(%Inventory{}, inventory_params)

    case Repo.insert(changeset) do
      {:ok, inventory} ->
        conn
        |> put_flash(:info, "Inventory created!")
        |> redirect(to: inventory_path(conn, :show, inventory))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Check your inputs!")
        |> render("new.html", inventory: changeset)
    end
  end

end

