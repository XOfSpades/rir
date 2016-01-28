# see: https://github.com/renatomoya/rest_api
defmodule Rir.Api.ArticlesView do
  use Rir.Web, :view

  def render("index.json", %{articles: articles}) do
    %{ articles: articles }
  end

  def render("article.json", %{article: article}) do
    %{ article: article }
  end
end

