defmodule Rir.BarAssociation do
  use Rir.Web, :model
  #use Ecto.Schema
  alias Ecto.Changeset

  schema "bar_associations" do
    field :name, :string
    field :street, :string
    field :postal_code, :string
    field :town, :string
    field :phone, :string
    field :fax, :string
    field :mail, :string
    field :web, :string
    belongs_to :impressum, Rir.Impressum

    timestamps
  end

  @required_fields [:name, :street, :postal_code, :town, :phone, :fax, :mail,
                    :web]

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> Changeset.cast(params, @required_fields)
    |> Changeset.validate_required(@required_fields)
end
end
