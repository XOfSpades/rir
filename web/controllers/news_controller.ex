defmodule Rir.NewsController do
  use Rir.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
