defmodule Rir.AdministrationController do
  use Rir.Web, :controller
  alias Rir.User
  alias Rir.Repo
  alias Rir.Session

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(user_params)

    { status, _user } = User.create(changeset, Repo)

    if status == :ok do
      conn
      |> put_flash(:info, "Your account was created")
      |> redirect(to: administration_path(conn, :index))
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> put_status(422)
      |> render "new.html", changeset: changeset
    end
  end

  def index(conn, _params) do
    # ToDo: Check weather user is authenticated
    if Session.logged_in?(conn) do
      render conn, "index.html"
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> put_status(401)
      |> redirect(to: "/admin-login")
    end
  end

  def delete(conn, params) do
    # ToDo: Check weather user is authenticated
    {user_id, ""} = Integer.parse(params["id"])

    { status, _responded_user } = User.destroy(user_id)

    if status == :ok do
      conn
      |> put_flash(:info, "User was deleted")
      |> put_status(204)
      |> redirect(to: "/administration-settings")
    else
      conn
      |> put_flash(:info, "Could not delete user")
      |> put_status(404)
      |> redirect(to: "/administration-settings")
    end
  end
end
