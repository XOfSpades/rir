defmodule Rir.UserTest do
  use Rir.ModelCase, async: false
  alias Rir.User

  @valid_attrs %{ password: "some content", email: "some@content" }

  test "Changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "Changeset with invalid attributes" do
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

  test "Password has at least 8 characters" do
    invalid_attrs = %{ password: "1234567", email: "some@content" }
    changeset1 = User.changeset(%User{}, invalid_attrs)
    refute changeset1.valid?

    valid_attrs = %{ password: "12345678", email: "some@content" }
    changeset2 = User.changeset(%User{}, valid_attrs)
    assert changeset2.valid?
  end

  test "Email is unique" do
    valid_changeset = User.changeset(%User{}, @valid_attrs)
    Rir.User.create(valid_changeset, Rir.Repo)

    invalid_changeset = User.changeset(%User{}, @valid_attrs)
    { status, changeset } = Rir.Repo.insert(invalid_changeset)

    assert status == :error
    refute changeset.valid?
  end

  test "An invalid changeset cannot be saved" do
    invalid_attrs = %{ email: "some@content" }
    invalid_changeset = User.changeset(%User{}, invalid_attrs)

    { status, responded_changeset } = Rir.Repo.insert(invalid_changeset)

    assert status == :error
    refute responded_changeset.valid?
  end

  test ".right_password?" do
    changeset = User.changeset(%User{}, @valid_attrs)
    { :ok, user } = Rir.User.create(changeset, Rir.Repo)

    user = Rir.Repo.get(Rir.User, user.id)
    crypted_password = user.crypted_password

    assert Rir.User.right_password?(@valid_attrs[:password], crypted_password)
    refute Rir.User.right_password?("wrong_password", crypted_password)
  end

  test "Password is set and hashed" do
    changeset = User.changeset(%User{}, @valid_attrs)
    { :ok, user } = Rir.User.create(changeset, Rir.Repo)

    user = Rir.Repo.get(Rir.User, user.id)
    crypted_password = user.crypted_password

    assert crypted_password != nil
    assert crypted_password != @valid_attrs[:password]
  end

  test "User has no plain password stored" do
    changeset = User.changeset(%User{}, @valid_attrs)
    { :ok, user } = Rir.User.create(changeset, Rir.Repo)

    user = Rir.Repo.get(Rir.User, user.id)
    password = user.password

    assert password == nil
  end
end
