defmodule WeControllerTest do
  use Rir.ConnCase, async: true

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Rir.Repo)
  end

  test "GET /ueber-uns" do
    conn = get(build_conn(), "/ueber-uns")
    assert html_response(conn, 200) =~ "Wir sind für Sie da"
  end
end
