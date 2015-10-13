defmodule Rir.UserTest do
  use Rir.ModelCase

  alias Rir.User

  @valid_attrs %{crypted_password: "some content", email: "some content"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    invalid_attrs1 = %{}
    changeset1 = User.changeset(%User{}, invalid_attrs1)
    refute changeset1.valid?

    invalid_attrs2 = %{email: "some content"}
    changeset2 = User.changeset(%User{}, invalid_attrs2)
    refute changeset2.valid?

    invalid_attrs3 = %{crypted_password: "some content"}
    changeset3 = User.changeset(%User{}, invalid_attrs3)
    refute changeset3.valid?
  end
end
