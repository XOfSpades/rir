defmodule Rir.ArticlesControllerTest do
  use Rir.ConnCase, async: true

  test "GET /aktuelles" do
    conn = get(conn(), "/aktuelles")
    assert html_response(conn, 200) =~ "Urteile"
  end
end
