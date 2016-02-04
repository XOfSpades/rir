defmodule Rir.ArticleTest do
  use Rir.ModelCase, async: false

  alias Rir.Article

  @valid_attrs %{
    header: "some content",
    content: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Article.changeset(%Article{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Article.changeset(%Article{}, @invalid_attrs)
    refute changeset.valid?
  end

  # test "Email is unique" do
  #   valid_changeset = Article.changeset(%Article{}, @valid_attrs)
  #   { :ok, article } = Article.create(valid_changeset, Repo)
  # end
end
