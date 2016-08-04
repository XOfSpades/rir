defmodule AboutControllerTest do
  use Rir.ConnCase, async: true

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Rir.Repo)
  end

  test "GET /impressum" do
    conn = get(build_conn(), "/impressum")
    assert html_response(conn, 200) =~ "Impressum"
  end
end
