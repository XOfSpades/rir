defmodule Rir.ImpressumTest do
  use Rir.ModelCase, async: false
  alias Rir.Impressum

  @bar_association_attrs %{
    name: "K. O. Putsch",
    street: "Area 52",
    postal_code: "4711",
    town: "Dirt",
    phone: "0190 / 666 666",
    fax: "0190 / 777 777",
    mail: "Putsch@do_not_ask.gov",
    web: "secret_area.com"
  }

  @liability_insurance_attrs %{
    name: "No Money",
    street: "Poorway",
    postal_code: "4711",
    town: "Dept City",
    phone: "0190 / 666 666",
    mail: "service@no-money.de"
  }

  @valid_attrs %{
    copyright: "some content",
    lawyer_info: "some content",
    turnover_tax_id: "some content",
    turnover_tax_nr: "some content",
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Impressum.changeset(%Impressum{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset1 = Impressum.changeset(%Impressum{}, @invalid_attrs)
    refute changeset1.valid?
    changeset2 = Impressum.changeset(
      %Impressum{},
      Map.take(@valid_attrs, [:copyright, :lawyer_info, :turnover_tax_id])
    )
    refute changeset2.valid?
    changeset2 = Impressum.changeset(
      %Impressum{},
      Map.take(@valid_attrs, [:copyright, :lawyer_info, :turnover_tax_nr])
    )
    refute changeset2.valid?
    changeset3 = Impressum.changeset(
      %Impressum{},
      Map.take(@valid_attrs, [:copyright, :turnover_tax_nr, :turnover_tax_id])
    )
    refute changeset3.valid?
    changeset4 = Impressum.changeset(
      %Impressum{},
      Map.take(@valid_attrs, [:lawyer_info, :turnover_tax_nr, :turnover_tax_id])
    )
    refute changeset4.valid?
  end

  test "changeset with valid optional attributes" do
    changeset = Impressum.changeset(
      %Impressum{},
      %{
        guarantor: "some content",
        turnover_tax_nr: "some content",
        fax: "some content",
        phone: "some content",
        street: "some content",
        town: "some content",
        mail: "some content",
        web: "some content",
        turnover_tax_id: "some content",
        lawyer_info: "some content",
        bar_association: @bar_association_attrs,
        liability_insurance: @liability_insurance_attrs,
        additional_information: "some content",
        copyright: "some content"
      }
    )
    assert changeset.valid?
  end
end
