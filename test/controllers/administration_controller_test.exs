defmodule Rir.AdministrationControllerTest do
  use Rir.ConnCase, async: false
  alias Rir.User

  @valid_attrs %{ password: "5ome_P4ssw0rd", email: "some@content" }

  test "Post /administration-settings" do
    conn1 = post(
      conn(),
      "/administration-settings",
      %{ user: @valid_attrs }
    )
    assert html_response(conn1, 302)

    conn2 = post(
      conn(),
      "/administration-settings",
      %{ user: @valid_attrs }
    )
    assert html_response(conn2, 422)

    conn3 = post(
      conn(),
      "/administration-settings",
      %{ user: %{ password: "12345678" } }
    )
    assert html_response(conn3, 422)

    conn4 = post(
      conn(),
      "/administration-settings",
      %{ user: %{ email: "foobar@baz" } }
    )
    assert html_response(conn4, 422)
  end

  test "delete /administration-settings" do
    changeset = User.changeset(%User{}, @valid_attrs)
    { :ok, user } = User.create(changeset, Rir.Repo)

    conn1 = delete(
      conn(),
      "administration-settings/#{user.id}"
    )
    assert html_response(conn1, 204)

    conn2 = delete(
      conn(),
      "administration-settings/#{user.id}"
    )
    assert html_response(conn2, 404)

  end
end
