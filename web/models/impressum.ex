defmodule Rir.Impressum do
  use Rir.Web, :model

  schema "impressums" do
    field :guarantor, :string
    field :fax, :string
    field :phone, :string
    field :street, :string
    field :town, :string
    field :mail, :string
    field :web, :string
    field :turnover_tax_nr, :string
    field :turnover_tax_id, :string
    field :lawyer_info, :string
    field :additional_information, :string
    field :copyright, :string
    has_one :bar_association, Rir.BarAssociation, on_delete: :fetch_and_delete
    has_one :liability_insurance,
            Rir.LiabilityInsurance,
            on_delete: :fetch_and_delete

    timestamps
  end

  @required_fields ~w(turnover_tax_nr turnover_tax_id lawyer_info
                      bar_association liability_insurance copyright)
  @optional_fields ~w(guarantor fax phone street town mail web
                      additional_information)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
