defmodule Rir.Impressum do
  use Ecto.Schema, :model
  alias Ecto.Changeset

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
    has_one :bar_association, Rir.BarAssociation, on_delete: :delete_all
    has_one :liability_insurance,
            Rir.LiabilityInsurance,
            on_delete: :delete_all

    timestamps
  end

  @required_fields [:turnover_tax_nr, :turnover_tax_id, :lawyer_info,
                    :copyright]
  @optional_fields [:guarantor, :fax, :phone, :street, :town, :mail, :web,
                    :additional_information]
  @all_fields Enum.reduce(
    @required_fields, @optional_fields, fn(item, acc) -> [item|acc] end)


  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """

  # http://blog.plataformatec.com.br/2015/08/working-with-ecto-associations-and-embeds/
  def changeset(model, params \\ :empty) do
    model
    |> Changeset.cast(params, @all_fields)
    |> Changeset.cast_assoc(:liability_insurance, required: true)
    |> Changeset.cast_assoc(:bar_association, required: true)
    |> Changeset.validate_required(@required_fields)
  end
end
