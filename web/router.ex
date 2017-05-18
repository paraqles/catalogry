defmodule Catalogry.Router do
  use Catalogry.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Catalogry do
    pipe_through :browser # Use the default browser stack

    get "/", InventoryController, :index

    resources "/inventories", InventoryController do
      resources "/items", ItemController do
        resources "/attributes", AttributeController
      end
    end

    resources "/users", UserController

    scope "/admin", Catalogry.Admin, as: :admin do
      resources "/inventories", InventoryController do
        resources "/items", ItemController do
          resources "/attributes", AttributeController
        end
      end
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Catalogry do
  #   pipe_through :api
  # end
end
