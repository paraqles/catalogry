defmodule Catalogry.Helper do
  import Plug.Conn

  alias Catalogry.Repo
  alias Catalogry.User

  def current_user(conn) do
    user = Repo.get!(%User{}, conn.assigns(:user_id))

    user
  end

end
