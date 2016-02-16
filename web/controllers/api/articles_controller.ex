defmodule Rir.Api.ArticlesController do
  use Rir.Web, :controller
  alias Rir.Article

  def index(conn, _params) do
    articles = Repo.all(Article)
    render(conn, "index.json", %{articles: articles})
  end

  # TODO: Authentication
  def create(conn, params) do
    { :ok, article } = Article.changeset(
      %Article{}, %{ header: params["header"], content: params["content"] }
    ) |> Rir.Repo.insert

    render(conn, "article.json", %{article: article})
  end

  # TODO Authentication
  def delete(conn, params) do
    {article_id, ""} = Integer.parse(params["id"])
    { status, responded_article } = Article.destroy(article_id)

    if status == :error do
      conn = put_status(conn, 404)
    end

    conn |> render("article.json", %{article: responded_article})
  end
end
