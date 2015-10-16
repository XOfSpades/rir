defmodule Rir.PageControllerTest do
  use Rir.ConnCase, async: true

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Ihre Anwälte in Rösrath"
  end
end
