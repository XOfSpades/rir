defmodule ApplicationController do
  use Rir.Web, :controller

  def unauthorized(conn) do
    conn
    |> put_flash(:info, "Please log in")
    |> put_status(401)
    |> redirect(to: "/admin-login")
  end
end
