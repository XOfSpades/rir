defmodule Rir.AdministrationController do
  use Rir.Web, :controller
  alias Rir.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    { status, user } = Rir.User.create(changeset, Rir.Repo)

    if status == :ok do

      conn
      |> put_flash(:info, "Your account was created")
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> put_status(422)
      |> render("new.html", changeset: changeset)
    end
  end
end
