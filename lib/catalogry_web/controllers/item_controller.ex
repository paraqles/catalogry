defmodule CatalogryWeb.ItemController do
  use Catalogry.Web, :controller

  require Logger

  alias Catalogry.Inventories

  alias Ecto

  def show(conn, %{"id" => item_id}) do
    render conn, "show.html"
  end

  def new(conn, %{"inventory_id" => inventory_id}) do
    render conn, "new.html"
  end

  def create(conn, %{"inventory_id" => inventory_id, "item" => item_params}) do
  end

end

