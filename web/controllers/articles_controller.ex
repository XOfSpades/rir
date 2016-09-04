defmodule Rir.ArticlesController do
  use Rir.Web, :controller
  alias Rir.Article
  alias Rir.Session

  def index(conn, _params) do
    articles = Rir.Repo.all(Article)
    if Session.logged_in?(conn) do
      render conn, "form.html", articles: articles
    else
      render conn, "index.html", articles: articles
    end
  end

  def create(conn, %{"article" => article_params}) do
    if Session.logged_in?(conn) do
      { :ok, article } = Article.changeset(
        %Article{},
        article_params
      ) |> Rir.Repo.insert

      redirect(conn, to: "/aktuelles")
    else
      ApplicationController.unauthorized(conn)
    end
  end

  def update(conn, params) do
    if Session.logged_in?(conn) do
      article = Rir.Repo.get(Article, params["id"])
                |> Ecto.Changeset.change(to_keyword_list(params["article"]))
      case Rir.Repo.update article do
        {:ok, _}        ->
          conn
          |> put_flash(:info, "Article updated.")
          |> redirect(to: "/aktuelles")
        {:error, _} ->
          conn
          |> put_flash(:info, "Failed to update article.")
          |> redirect(to: "/aktuelles")
      end
    else
      ApplicationController.unauthorized(conn)
    end
  end

  def delete(conn, params) do
    if Session.logged_in?(conn) do
      {article_id, ""} = Integer.parse(params["id"])
      { status, responded_article } = Article.destroy(article_id)

      if status == :error do
        conn = put_status(conn, 404)
      end
      redirect(conn, to: "/aktuelles")
    else
      ApplicationController.unauthorized(conn)
    end
  end

  defp to_keyword_list(dict) do
    convert = fn
      item when item == "true" or item == "false" -> String.to_atom(item)
      item -> item
    end
    Enum.map(
      dict, fn({key, value}) -> {String.to_atom(key), convert.(value)} end)
  end
end
