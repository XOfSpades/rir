defmodule Rir.AdministrationController do
  use Rir.Web, :controller
  alias Rir.User
  alias Rir.Repo
  alias Rir.Session

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"administration" => user_params}) do
    if Session.logged_in?(conn) do
      changeset = User.changeset(%User{}, user_params)

      case User.create(changeset) do
        { :ok, _user } ->
          conn
          |> put_flash(:info, "Your account was created")
          |> redirect(to: administration_path(conn, :index))
        _ ->
          conn
          |> put_flash(:info, "Unable to create account")
          |> put_status(422)
          |> render("new.html", changeset: changeset)
      end
    else
      ApplicationController.unauthorized(conn)
    end
end

  def index(conn, _params) do
    if Session.logged_in?(conn) do
      user_admins = Rir.Repo.all(User)
      render conn, "index.html", admins: user_admins
    else
      ApplicationController.unauthorized(conn)
    end
  end

  def delete(conn, params) do
    if Session.logged_in?(conn) do
      {user_id, ""} = Integer.parse(params["id"])

      case User.destroy(user_id) do
        { :ok, _responded_user } ->
          conn
          |> put_flash(:info, "User was deleted")
          |> put_status(204)
          |> redirect(to: "/administration-settings")
        _ ->
          conn
          |> put_flash(:info, "Could not delete user")
          |> put_status(404)
          |> redirect(to: "/administration-settings")
      end
    else
      ApplicationController.unauthorized(conn)
    end
  end
end
