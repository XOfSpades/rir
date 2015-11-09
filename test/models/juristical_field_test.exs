defmodule Rir.JuristicalFieldTest do
  use Rir.ModelCase
  alias Rir.Repo
  alias Rir.JuristicalField

  @valid_attrs %{label: "Familienrecht"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = JuristicalField.changeset(@valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = JuristicalField.changeset(@invalid_attrs)
    refute changeset.valid?
  end

  test ".all" do
    changeset1 = JuristicalField.changeset(%{ label: "Familienrecht" })
    changeset2 = JuristicalField.changeset(%{ label: "Mietrecht"})
    Enum.each(
      [changeset1, changeset2],
      fn (item) -> JuristicalField.create(item, Repo) end
    )

    fields = Repo.all(JuristicalField) |> Enum.map(&(&1.label))
    assert fields == ["Familienrecht", "Mietrecht"]
  end

  test "unique fields" do
    valid_changeset = JuristicalField.changeset(@valid_attrs)
    Repo.insert(valid_changeset)

    invalid_changeset =JuristicalField.changeset(@valid_attrs)
    { status, changeset } = Repo.insert(invalid_changeset)

    assert status == :error
    refute changeset.valid?
  end
end
