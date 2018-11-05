defmodule CatalogryWeb.Admin.UserController do
  use Catalogry.Web, :controller

  alias Catalogry.Accounts

  def show(conn, %{"user_id" => user_id}) do
    Accounts.get(user_id)
  end

end

