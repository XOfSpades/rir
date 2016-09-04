defmodule Rir.Api.ArticlesController do
  use Rir.Web, :controller
  alias Rir.Article

  def index(conn, _params) do
    articles = Repo.all(Article)
    render(conn, "index.json", %{articles: articles})
  end
end
