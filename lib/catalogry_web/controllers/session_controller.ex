defmodule CatalogryWeb.SessionController do
  use Catalogry.Web, :controller

  require Logger

  alias Catalogry.Accounts

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"password" => password, "login_name" => login_name}) do
  end

  def delete(conn, _params) do
  end

end

