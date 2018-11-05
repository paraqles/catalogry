defmodule CatalogryWeb.PossessingController do
  use Catalogry.Web, :controller

  require Logger

  alias Ecto

  def index(conn, %{"item_id" => item_id}) do
  end

  def show(conn, %{"id" => possessing_id}) do
  end

  def new(conn, %{"inventory_id" => inventory_id, "item_id" => item_id}) do
  end

  def create(conn, %{ "inventory_id" => inventory_id,
                      "item_id" => item_id,
                      "possessing" => possessing_params}) do
  end

end

