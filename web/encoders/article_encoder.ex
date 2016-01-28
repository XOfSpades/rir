defimpl Poison.Encoder, for: Rir.Article do

  def encode(article, _options) do
    %{
      id: article.id,
      header: article.header,
      content: article.content,
      inserted_at: article.inserted_at,
      updated_at: article.updated_at
    } |> Poison.Encoder.encode([])
  end

end
