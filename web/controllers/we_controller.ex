defmodule Rir.WeController do
  use Rir.Web, :controller

  def index(conn, _params) do
    lawyers = Rir.Repo.all(Lawyer)
    render conn, "index.html", lawyers: lawyers
  end
end
