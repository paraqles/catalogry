defmodule CatalogryWeb.InventoryController do
  use Catalogry.Web, :controller

  require Logger

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => inventory_id}) do
    render conn, "show.html"
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"inventory" => inventory_params}) do
  end

end

