defmodule AboutControllerTest do
  use Rir.ConnCase, async: true

  test "GET /impressum" do
    conn = get(conn(), "/impressum")
    assert html_response(conn, 200) =~ "Impressum"
  end
end
