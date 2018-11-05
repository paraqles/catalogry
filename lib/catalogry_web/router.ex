defmodule CatalogryWeb.Router do
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

  pipeline :authenticated do
  end

  scope "/", CatalogryWeb do
    pipe_through :browser # Use the default browser stack

    get "/", InventoryController, :index

    get "/login", SessionController, :new
    get "/logout", SessionController, :delete
    get "/register", UserController, :new
    post "/register", UserController, :create

    get "/profile", UserController, :show

    resources "/inventories", InventoryController do
      pipe_through :authenticated

      resources "/items", ItemController do
        resources "/possessings", PossessingController do
          resources "/comments", PossessingCommentController
        end
        resources "/attributes", AttributeController
      end
    end

    scope "/admin", CatalogryWeb.Admin, as: :admin do
      pipe_through :authenticated

      resources "/users", UsersController do
        resources "/authenticators", AuthenticatorController
        resources "/roles", RoleController
      end

      resources "/sessions", SessionsController

      resources "/inventories", InventoryController do
        resources "/items", ItemController do
          resources "/possessings", PossessingController do
            resources "/comments", PossessingCommentController
          end

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
