defmodule Rir.User do
  use Rir.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true
    timestamps
  end

  @required_fields ~w(email password)
  @optional_fields ~w()

  def create(changeset, repo) do
    changeset
    # |> put_change(:crypted_password, hashed_password(changeset.params["password"]))
    |> repo.insert()
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    # |> unique_constraint(:email, on: Rir.Repo, downcase: true)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
  end
end
