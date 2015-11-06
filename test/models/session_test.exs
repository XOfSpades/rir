defmodule Rir.SessionTest do
  use Rir.ModelCase, async: false
  alias Rir.User
  alias Rir.Repo
  alias Rir.Session

  @user_parameter %{ "password" => "D4_P455w0rd", "email" => "some@content" }
  @user_changeset User.changeset(@user_parameter)

  test "Create a session at login when password is valid" do
    { :ok, user } = User.create(@user_changeset, Repo)

    { status, returned_user } = Session.login(@user_parameter, Repo)

    assert status == :ok
    assert returned_user.email == user.email
    assert returned_user.id == user.id
  end

  test "Don't create a session at login when password is invalid" do
    wrong_parameter = %{ "password" => "wrong_pw", "email" => "some@content" }
    { :ok, _user } = User.create(@user_changeset, Repo)

    { status, returned_user } = Session.login(wrong_parameter, Repo)

    assert status == :error
    assert returned_user == nil
  end
end
