defmodule WeControllerTest do
  use Rir.ConnCase, async: true

  test "GET /ueber-uns" do
    conn = get(conn(), "/ueber-uns")
    assert html_response(conn, 200) =~ "Wir sind für Sie da"
  end
end
