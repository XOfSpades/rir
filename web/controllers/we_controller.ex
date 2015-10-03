defmodule Rir.WeController do
  use Rir.Web, :controller

  def index(conn, _params) do
    members = Rir.Repo.all(Member)
    render conn, "index.html", members: members
  end
end
