# assert conn.status == 302
defmodule Rir.AdministrationControllerTest do
  use Rir.ConnCase, async: false

  test "Post /administration_settings" do
    conn1 = post(
      conn(),
      "/administration_settings",
      %{ user: %{ email: "foo@bar", password: "12345678" } }
    )
    assert html_response(conn1, 302)

    conn2 = post(
      conn(),
      "/administration_settings",
      %{ user: %{ email: "foo@bar", password: "12345678" } }
    )
    assert html_response(conn2, 422)

    conn3 = post(
      conn(),
      "/administration_settings",
      %{ user: %{ password: "12345678" } }
    )
    assert html_response(conn3, 422)

    conn4 = post(
      conn(),
      "/administration_settings",
      %{ user: %{ email: "foobar@baz" } }
    )
    assert html_response(conn4, 422)
  end
end
