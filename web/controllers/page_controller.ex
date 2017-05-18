defmodule Catalogry.PageController do
  use Catalogry.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
