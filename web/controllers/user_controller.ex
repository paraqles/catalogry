defmodule Catalogry.UserController do
  use Catalogry.Web, :controller

  require Logger

  alias Catalogry.User

  def show(conn, _params) do
    render conn, "show.html", user: current_user(conn)
  end

  def new(conn, _params) do
    user = %User{}

    render conn, "new.html", user: user
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "User #{changeset.name} created!")
        |> redirect(to: inventory_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Check your inputs!")
        |> render("new.html", user: changeset)
    end
  end

end

