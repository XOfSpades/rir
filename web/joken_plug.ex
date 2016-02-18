defmodule Joken.Plug do
  use Rir.Web, :router

  # We don't want to show that the user was not authorized. Render 404
  def on_error(conn, _msg) do
    body = %{status: 404, message: "not found"}
    conn = conn |> put_status(404)
    IO.puts "conn: #{conn}"
    {conn, body}
  end
end
