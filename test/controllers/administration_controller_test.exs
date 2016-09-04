defmodule Rir.AdministrationControllerTest do
  use Rir.ConnCase, async: false
  alias Rir.User

  @valid_attrs %{ password: "5ome_P4ssw0rd", email: "some@content" }

  test "POST /administration-settings" do
    conn = post(
      conn(),
      "/administration-settings",
      %{ administration: @valid_attrs }
    )
    assert html_response(conn, 401)

    #TODO: Test positive case. Currently no clue how :-/

    # conn2 = conn()

    # put_in(conn2.secret_key_base, "some secret")
    # |> Plug.Session.call(@signing_opts)
    # |> fetch_session

    # conn2 = post(
    #   conn2,
    #   "/administration-settings",
    #   %{ administration: @valid_attrs }
    # )
    # assert html_response(conn2, 302)

    # conn4 = post(
    #   conn,
    #   "/administration-settings",
    #   %{ administration: @valid_attrs }
    # )
    # assert html_response(conn4, 422)

    # conn5 = post(
    #   conn,
    #   "/administration-settings",
    #   %{ administration: %{ password: "12345678" } }
    # )
    # assert html_response(conn5, 422)

    # conn6 = post(
    #   conn,
    #   "/administration-settings",
    #   %{ administration: %{ email: "foobar@baz" } }
    # )
    # assert html_response(conn6, 422)
  end

  test "DELETE /administration-settings" do
    changeset = User.changeset(%User{}, @valid_attrs)
    { :ok, user } = User.create(changeset)

    conn1 = delete(
      conn(),
      "administration-settings/#{user.id}"
    )
    assert html_response(conn1, 401)

    # conn = Conn.assign(conn, :current_user, current_user)

    # conn3 = delete(
    #   conn,
    #   "administration-settings/#{user.id}"
    # )
    # assert html_response(conn3, 200)
  end

  # test "GET administration-settings returns administrator list" do
  #   changeset = User.changeset(%User{}, @valid_attrs)
  #   { :ok, _user } = User.create(changeset)

  #   conn = get(conn(), "/administration-settings")
  #   assert redirected_to(conn, 401) == "/admin-login"
  # end
end
