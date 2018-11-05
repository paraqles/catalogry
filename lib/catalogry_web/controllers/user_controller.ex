defmodule CatalogryWeb.UserController do
  use Catalogry.Web, :controller

  require Logger

  def show(conn, _params) do
    render conn, "show.html"
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => user_params}) do
  end

end

