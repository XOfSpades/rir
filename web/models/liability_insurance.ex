defmodule Rir.LiabilityInsurance do
  use Ecto.Schema
  alias Ecto.Changeset

  schema "liability_insurances" do
    field :name, :string
    field :street, :string
    field :postal_code, :string
    field :town, :string
    field :phone, :string
    field :mail, :string
    belongs_to :impressum, Rir.Impressum

    timestamps
  end

  @required_fields [:name, :postal_code, :town]
  @optional_fields [:street, :phone, :mail]
  @all_parameters Enum.reduce(
    @required_fields, @optional_fields, fn(item, acc) -> [item|acc] end
  )

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> Changeset.cast(params, @all_parameters)
    |> Changeset.validate_required(@required_fields)
  end
end
