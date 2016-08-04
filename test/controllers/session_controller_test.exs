defmodule Rir.SessionControllerTest do
  use Rir.ConnCase, async: false
  alias Rir.User
  alias Rir.Session

  @valid_attrs %{ password: "5ome_P4ssw0rd", email: "some@content" }

  test "POST /session" do
    changeset = User.changeset(%User{}, @valid_attrs)
    { :ok, _ } = User.create(changeset)

    conn1 = post(
      build_conn(),
      "/session",
      %{ user:
        %{ email: @valid_attrs[:email], password: @valid_attrs[:password] }
      }
    )
    assert html_response(conn1, 302)

    conn2 = post(
      build_conn(),
      "/session",
      %{ user: %{ email: @valid_attrs[:email], password: "wrong_password" } }
    )
    assert html_response(conn2, 403)
  end

  test "GET /admin-login" do
    conn = get(build_conn(), "/admin-login")
    assert html_response(conn, 200)
  end

  test "Integration test for session" do
    changeset = User.changeset(%User{}, @valid_attrs)
    { :ok, user } = User.create(changeset)

    conn1 = post(
      build_conn(),
      "/session",
      %{ user:
        %{ email: @valid_attrs[:email], password: @valid_attrs[:password] }
      }
    )
    assert html_response(conn1, 302)

    current_user = Session.current_user(conn1)
    assert current_user.id == user.id
    assert current_user.email == user.email

    conn2 = post(
      build_conn(),
      "/session/delete"
    )
    assert html_response(conn2, 302)

    current_user = Session.current_user(conn2)
    assert current_user == nil
  end
end
