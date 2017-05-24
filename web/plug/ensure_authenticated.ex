defmodule Catalogry.Plug.ensure_authenticated do
  alias Catalogry.User

  def init(opts), do: opts

  def call(conn, _params) do
    if not conn.assings[:user_id] do
      Phoenix.Controller.redirect(to: login_path())
    end
  end

end

