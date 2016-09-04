defmodule Member do
  use Ecto.Schema
  alias Ecto.Changeset

  schema "members" do
    field :first_name
    field :last_name
    field :email
    field :content
    field :image_url

    timestamps
  end

  @required_fields [:first_name, :last_name, :email, :content, :image_url]

  def changeset(model, params \\ :empty) do
    model
    |> Changeset.cast(params, @required_fields)
    |> Changeset.validate_required(@required_fields)
  end
end
