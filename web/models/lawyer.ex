defmodule Lawyer do
  use Rir.Web, :model

  schema "lawyers" do
    field :first_name
    field :last_name
    field :email
    field :content

    timestamps
  end

  @required_fields ~w(first_name last_name email content)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
