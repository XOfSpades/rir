defmodule Rir.LiabilityInsurance do
  use Ecto.Schema

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

  @required_fields ~w(name postal_code town)
  @optional_fields ~w(street phone mail)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> Ecto.Changeset.cast(params, @required_fields, @optional_fields)
  end
end
