defmodule Rir.UserTest do
  use Rir.ModelCase

  alias Rir.User

  @valid_attrs %{ password: "some content", email: "some@content" }

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    invalid_attrs1 = %{}
    changeset1 = User.changeset(%User{}, invalid_attrs1)
    refute changeset1.valid?

    invalid_attrs2 = %{ email: "some@content" }
    changeset2 = User.changeset(%User{}, invalid_attrs2)
    refute changeset2.valid?

    invalid_attrs3 = %{ password: "some content" }
    changeset3 = User.changeset(%User{}, invalid_attrs3)
    refute changeset3.valid?
  end

  test "password has at least 8 characters" do
    invalid_attrs = %{ password: "1234567", email: "some@content" }
    changeset1 = User.changeset(%User{}, invalid_attrs)
    refute changeset1.valid?

    valid_attrs = %{ password: "12345678", email: "some@content" }
    changeset2 = User.changeset(%User{}, valid_attrs)
    assert changeset2.valid?
  end

  test "email is unique" do
    valid_changeset = User.changeset(%User{}, @valid_attrs)
    { :ok, _ } = Rir.Repo.insert(valid_changeset)

    invalid_changeset = User.changeset(%User{}, @valid_attrs)
    { _, changeset } = Rir.Repo.insert(invalid_changeset)

    refute changeset.valid?
  end
end
