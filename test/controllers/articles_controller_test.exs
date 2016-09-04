defmodule Rir.ArticlesControllerTest do
  use Rir.ConnCase, async: false
  import Mock

  @valid_attrs %{
    header: "some content",
    content: "some content",
    hot_topic: false
  }

  def with_session(conn) do
    session_opts = Plug.Session.init(store: :cookie, key: "_app",
                                     encryption_salt: "abc",
                                     signing_salt: "abc")
    conn
    |> Map.put(:secret_key_base, String.duplicate("abcdefgh", 8))
    |> Plug.Session.call(session_opts)
    |> Plug.Conn.fetch_session()
    |> Plug.Conn.fetch_params()
  end

  test "GET /aktuelles" do
    conn = get(conn(), "/aktuelles")
    response1 = html_response(conn, 200)
    assert response1 =~ "Urteile"
    with_mock Rir.Session, [logged_in?: fn(_parameter) -> true end] do
      conn2 = get(conn(), "/aktuelles")
      assert html_response(conn2, 200) != response1
    end
  end

  test "UPDATE /articles/:id" do
    {:ok, article} = (Rir.Article.changeset(%Rir.Article{}, @valid_attrs)
    |> Rir.Repo.insert)

    new_params = %{
      header: "new content", content: "new content", hot_topic: true
    }

    conn = patch(conn(), "/aktuelles/#{article.id}", %{article: new_params})
    assert html_response(conn, 401)

    not_updated_article = Rir.Repo.get!(Rir.Article, article.id)

    assert not_updated_article.header == "some content"
    assert not_updated_article.content == "some content"
    assert not_updated_article.hot_topic == false

    with_mock Rir.Session, [logged_in?: fn(_parameter) -> true end] do
      conn = patch(conn(), "/aktuelles/#{article.id}", %{ article: new_params})
      assert html_response(conn, 302)

      updated_article = Rir.Repo.get!(Rir.Article, article.id)
      assert updated_article.header == "new content"
      assert updated_article.content == "new content"
      assert updated_article.hot_topic == true
    end
  end
end
