defmodule Rir.JuristicalField do
  use Rir.Web, :model
  alias Rir.JuristicalField

  schema "juristical_fields" do
    field :label, :string

    timestamps
  end

  @required_fields ~w(label)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(params \\ :empty) do
    %JuristicalField{}
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:label)
    |> validate_length(:label, max: 30)
  end

  def create(changeset, repo) do
    repo.insert(changeset)
  end
end
