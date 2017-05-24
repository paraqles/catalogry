defmodule Catalogry.PossessingController do
  use Catalogry.Web, :controller

  require Logger

  alias Catalogry.Item
  alias Catalogry.Inventory
  alias Catalogry.Possessing
  alias Catalogry.User

  alias Ecto

  def index(conn, %{"item_id" => item_id}) do
    item = Repo.get!(Item, item_id) |> Repo.preload(:possesings)

    render conn, "index.html", item: item
  end

  def show(conn, %{"id" => possessing_id}) do
    possessing = Repo.get!(Possessing, possessing_id)

    render conn, "show.html", possessing: possessing
  end

  def new(conn, %{"inventory_id" => inventory_id, "item_id" => item_id}) do
    inventory = Repo.get!(Inventory, inventory_id)
    item = Repo.get!(Item, item_id)
    changeset = item
      |> build_assoc(:possessings)
      |> Possessing.changeset()

    render conn, "new.html", possessing: changeset, item: item, inventory: inventory
  end

  def create(conn, %{ "inventory_id" => inventory_id,
                      "item_id" => item_id,
                      "possessing" => possessing_params}) do
    inventory = Repo.get!(Inventory, inventory_id)
    item = Repo.get!(Item, item_id)
      |> Repo.preload(:possessings)

    changeset = Possessing.changeset(%Possessing{}, possessing_params)
                |> Ecto.Changeset.change(item_id: item.id)

    Logger.debug "changeset: #{inspect(changeset)}"

    case Repo.insert(changeset) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item rented!")
        |> redirect(to: inventory_item_path(conn, :show, inventory, item))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Check your inputs!")
        |> render("new.html", changeset: changeset, inventory: inventory, item: item)
    end
  end

end

