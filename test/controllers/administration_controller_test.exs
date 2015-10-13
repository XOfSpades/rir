# assert conn.status == 302
defmodule Rir.AdministrationControllerTest do
  use Rir.ConnCase

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
    assert html_response(conn2, 302)
  end
end
