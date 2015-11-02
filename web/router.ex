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
    get "/ueber_uns", WeController, :index
    get "/impressum", AboutController, :index
    get "/aktuelles", NewsController, :index
    get "/kontakt", ContactController, :index
    resources "/administration-settings", AdministrationController,
    only: [:index, :create, :delete, :new]
    get "/admin-login", SessionController, :new
    post "/session", SessionController, :create
    delete "/session", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", Rir do
  #   pipe_through :api
  # end
end
