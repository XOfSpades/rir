defmodule Rir.WeController do
  use Rir.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
