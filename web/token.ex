defmodule Rir.Token do

  def create(user_id) do
    %{user_id: user_id}
    |> Joken.token
    |> Joken.with_signer(Joken.hs256(jwt_secret))
  end

  def verify(token_string) do
    token_string
    |> Joken.token
    |> Joken.with_signer(Joken.hs256(jwt_secret))
    |> Joken.with_json_module(Poison)
    |> Joken.verify!
  end

  defp jwt_secret do
    :rir
    |> Application.get_env(Rir.Endpoint)
    |> Keyword.fetch!(:jwt_secret)
  end
end
