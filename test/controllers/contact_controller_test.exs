defmodule ContactControllerTest do
  use Rir.ConnCase, async: true

  test "GET /kontakt" do
    conn = get(build_conn(), "/kontakt")
    assert html_response(conn, 200) =~ "Sie haben Fragen? Kontaktieren Sie uns"
  end
end
