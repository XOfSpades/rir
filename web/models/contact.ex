defmodule Rir.Contact do
  use Rir.Web, :model
  alias Ecto.Changeset

  schema "contacts" do
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :email, :string
    field :header, :string
    field :message, :string

    timestamps
  end

  @required_fields [:first_name, :last_name, :header, :message, :phone, :email]

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

  def destroy(id) do
    case Rir.Repo.get(Rir.Contact, id) do
      nil -> { :error, nil }
      contact -> Rir.Repo.delete(contact)
    end
  end

end
