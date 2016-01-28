defmodule Rir.Api.ArticlesController do
  use Rir.Web, :controller
  alias Rir.Article

  def index(conn, _params) do
    articles = Repo.all(Article)
    render(conn, "index.json", %{articles: articles})
  end

  def create(conn, params) do
    { :ok, article } = Article.changeset(
      %Article{}, %{ header: params["header"], content: params["content"] }
    ) |> Rir.Repo.insert

    render(conn, "article.json", %{article: article})
  end
end
