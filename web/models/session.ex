defmodule Rir.Session do
  alias Rir.User
  alias Rir.Authenticate.Password, as: Password

  def logged_in?(conn), do: !!current_user(conn)

  def current_user(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user)
    if user_id, do: Rir.Repo.get(User, user_id)
  end

  def login(params) do
    user = Rir.Repo.get_by(User, email: String.downcase(params["email"]))
    case authenticate(user, params["password"]) do
      true -> { :ok, user }
      _    -> { :error , nil }
    end
  end

  defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> Password.is_password(password, user.crypted_password)
    end
  end
end
