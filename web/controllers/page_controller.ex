defmodule Rir.PageController do
  use Rir.Web, :controller

  def index(conn, _params) do
    articles = Rir.Article.hot_topics
    render conn, "index.html", articles: articles
  end
end
