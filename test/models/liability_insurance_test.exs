defmodule Rir.LiabilityInsuranceTest do
  use Rir.ModelCase, async: false

  alias Rir.LiabilityInsurance

  @valid_attrs %{
    fax: "some content",
    mail: "some content",
    name: "some content",
    phone: "some content",
    street: "some content",
    postal_code: "some code",
    town: "some content",
    web: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = LiabilityInsurance.changeset(%LiabilityInsurance{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = LiabilityInsurance.changeset(%LiabilityInsurance{}, @invalid_attrs)
    refute changeset.valid?
  end
end
