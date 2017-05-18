defmodule Catalogry.View do
  use Phoenix.View, root: "web/templates"

  def csrf_token(conn) do
    Plug.Conn.get_session(conn, :csrf_token)
  end
end
