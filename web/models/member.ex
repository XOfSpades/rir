defmodule Member do
  use Rir.Web, :model

  schema "members" do
    field :first_name
    field :last_name
    field :email
    field :content
    field :image_url

    timestamps
  end

  @required_fields ~w(first_name last_name email content image_url)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
