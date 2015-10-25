defmodule Rir.Session do
  alias Rir.User
  alias Rir.Authenticate.Password, as: Password

  def logged_in?(conn), do: !!current_user(conn)

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Rir.Repo.get(User, id)
  end

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> Password.is_password(password, user.crypted_password)
    end
  end
end
