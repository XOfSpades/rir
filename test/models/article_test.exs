defmodule Rir.ArticleTest do
  use Rir.ModelCase, async: false

  alias Rir.Article

  @valid_attrs %{
    header: "some content",
    content: "some content",
    hot_topic: false
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Article.changeset(%Article{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Article.changeset(%Article{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "delete an existing article" do
    {:ok, article} = (Article.changeset(%Article{}, @valid_attrs)
      |> Rir.Repo.insert)
    {status, response} = Article.destroy(article.id)

    fields = [:content, :header, :inserted_at, :updated_at, :id]

    assert status == :ok
    assert Map.take(response, fields) == Map.take(article, fields)
  end

  test "return an error when an article doesn't exist" do
    {status, response} = Article.destroy(1234567)

    assert status == :error
    assert response == nil
  end

  test "returns hot topics" do
    {:ok, _article} = (Article.changeset(%Article{}, @valid_attrs)
      |> Rir.Repo.insert)
    {:ok, hot_article} = (Article.changeset(%Article{},
                          %{
                            header: "The hot one",
                            content: "The nacked and the famous",
                            hot_topic: true})
      |> Rir.Repo.insert)
    result = Article.hot_topics
    assert result == [hot_article]
end
end
