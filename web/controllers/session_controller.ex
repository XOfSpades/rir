defmodule Rir.SessionController do
  use Rir.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => session_params}) do
    case Rir.Session.login(session_params, Rir.Repo) do
      { :ok, user } ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Logged in")
        |> redirect(to: administration_path(conn, :index))
      { :error, _ } ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> put_status(403)
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/admin-login")
  end
end
