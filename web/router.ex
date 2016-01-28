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
    get "/aktuelles", ArticlesController, :index
    get "/kontakt", ContactController, :index
    resources "/administration-settings", AdministrationController,
    only: [:index, :create, :delete, :new]
    get "/admin-login", SessionController, :new
    post "/session", SessionController, :create
    post "/session/delete", SessionController, :delete
  end

  scope "/api", Rir do
    pipe_through :api

    get "/aktuelles", Api.ArticlesController, :index
    post "/aktuelles", Api.ArticlesController, :create
  end
end
