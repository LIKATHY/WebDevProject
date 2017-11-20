defmodule MangalikeWeb.Router do
  use MangalikeWeb, :router
  import MangalikeWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_user
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_user
  end

  scope "/", MangalikeWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/series", SerieController, except: [:new, :edit, :create, :delete]
    resources "/chats", ChatController, except: [:new, :delete, :index]
    resources "/lists", ListController
    post "/sessions", SessionController, :login
    delete "/sessions", SessionController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", MangalikeWeb do
  #   pipe_through :api
  # end
end
