defmodule Rir.Router do
  use Rir.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Rir do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/ueber-uns", WeController, :index
    get "/impressum", AboutController, :index
    # get "/aktuelles", ArticlesController, :index
    resources "/aktuelles", ArticlesController, only: [:index, :create, :delete]
    patch "/aktuelles/:id", ArticlesController, :update
    post "/aktuelles/:id/delete", ArticlesController, :delete
    resources "/kontakt", ContactsController, only: [:index, :create, :delete]
    resources "/administration-settings", AdministrationController,
    only: [:index, :create, :delete, :new]
    get "/admin-login", SessionsController, :new
    post "/session", SessionsController, :create
    post "/session/delete", SessionsController, :delete
  end

  scope "/api", Rir do
    pipe_through :api

    resources "/aktuelles", Api.ArticlesController, only: [:index]
  end
end
