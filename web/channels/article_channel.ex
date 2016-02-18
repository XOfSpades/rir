defmodule Rir.ArticleChannel do
  use Phoenix.Channel

  def join("act_ui:agent_status:" <> jwt_token, _params, socket) do
    case Token.verify(jwt_token) do
      {:ok, verified_token} ->
        session_token = verified_token |> Map.fetch!("session_token")
        session_info = SessionCache.get_info!(session_token)
        socket = assign(socket, :session_token, session_token)
        socket = assign(socket, :session_info, session_info)
        socket = assign(socket, :jwt_token, jwt_token)
        AgentStatus.Events.notify_joined(AgentStatus.Events,
                                         {session_token, jwt_token})
        {:ok, socket}
      {:error, _error} ->
        {:error, %{reason: "unauthorized"}}
    end
  end

  def terminate(_msg, socket) do
    session_token = socket.assigns[:session_token]
    jwt_token = socket.assigns[:jwt_token]
    AgentStatus.Events.notify_left(AgentStatus.Events,
                                   {session_token, jwt_token})
  end
end
