defmodule Rir.AuthenticationRequestTest do
  use Rir.ConnCase, async: false
  alias Rir.User

  @valid_attrs %{ password: "5ome_P4ssw0rd", email: "some@content" }

  test "get administration index page after login" do
    changeset = User.changeset(%User{}, @valid_attrs)
    { :ok, _user } = User.create(changeset)

    conn1 = post(build_conn(), "/session", %{ user: @valid_attrs })
    assert html_response(conn1, 302)

    conn2 = get(conn1, "/administration-settings")
    assert html_response(conn2, 200) =~ "Admin User"
    #assert redirected_to(conn2, 200) == "/admin-login"
  end
end
