defmodule Rir.PageControllerTest do
  use Rir.ConnCase, async: true

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Rir.Repo)
  end

  test "GET /" do
    conn = get build_conn(), "/"
    assert html_response(conn, 200) =~ "Ihre Anwälte in Rösrath"
  end
end
