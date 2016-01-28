defmodule Rir.Api.ArticlesControllerTest do
  use Rir.ConnCase, sync: true
  alias Rir.Article

  test "GET /api/aktuelles" do
    data = [
      %{ :header => "h1", :content => "content1" },
      %{ :header => "h2", :content => "content2" }
    ]

    articles = Enum.map(data, fn (data_hash) ->
      { :ok, article } = Article.changeset(
        %Article{}, data_hash
      ) |> Rir.Repo.insert
      article
    end)

    response = get(conn(), "/api/aktuelles")
    assert response.status == 200

    response_body = Poison.decode!(response.resp_body)

    atomize_keys = fn(hash) ->
      Enum.reduce(
        hash,
        %{},
        fn ({k,v}, acc) -> Map.merge(acc, %{String.to_atom(k) => v}) end
      ) end


    string_key_result = response_body["articles"]
      |> Enum.map(fn (hash) -> Map.take(hash, ["id", "header", "content"]) end)
    result = Enum.map(string_key_result, fn (hash) -> atomize_keys.(hash) end)

    assert result == Enum.map(
      articles, fn (article) -> Map.from_struct(article)
                                  |> Map.take([:header, :content, :id]) end)
  end

  test "POST /api/aktuelles" do
    request_body =
      %{ "header" => "WAT", "content" => "Let's talk about Elixir" }
    response = post(conn(), "/api/aktuelles", request_body)

    assert response.status == 200

    response_body = Poison.decode!(response.resp_body)
    result = response_body["article"] |> Map.take(["header", "content"])

    assert result == request_body
  end
end
