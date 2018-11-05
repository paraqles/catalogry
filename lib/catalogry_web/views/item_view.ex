defmodule CatalogryWeb.ItemView do
  use Catalogry.Web, :view

  require Ecto.Query

  alias Catalogry.Repo
  alias CatalogryWeb.Possessing

  def states do
    [ gettext("In Storage"),
      gettext("Lent"),
      gettext("In Repair"),
      gettext("Unavailable")]
  end

  def possessor(item) do
    possessing = Repo.one(
        Ecto.Query.from(Possessing)
        |> Ecto.Query.where(item_id: ^item.id)
        |> Ecto.Query.order_by([desc: :return_date]))

    if not(is_nil(possessing)) do
      Repo.get!(User, possessing[:possessor])
    end
  end

  def return_date(item) do
    possessing = Repo.one(
        Ecto.Query.from(Possessing)
        |> Ecto.Query.where(item_id: ^item.id)
        |> Ecto.Query.order_by([desc: :return_date]))

    possessing[:return_date]
  end

end

