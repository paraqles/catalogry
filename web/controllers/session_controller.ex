defmodule Catalogry.SessionController do
  use Catalogry.Web, :controller

  require Logger

  alias Catalogry.User
  alias Catalogry.Authenticator

  def new(conn, _params) do
    user = User.changeset(%User{})
    render conn, "new.html", user: user
  end

  def create(conn, %{"password" => password, "login_name" => login_name}) do
    user = Repo.one(User, :login_name, login_name)
            |> Repo.preload(:authenticators,
                            from(a in Authenticator,
                            where: a.invalid == false))
    
    for authenticator <- user.authenticators do
      if authenticator.secret == password do
        conn.put_session(user_id: user.id)
        redirect(to: inventory_path(conn, :index))
      end
    end
  end

  def delete(conn, _params) do
    if current_user(conn) do
    end
  end

end

