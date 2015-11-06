defmodule Rir.User do
  use Rir.Web, :model
  alias Rir.Authenticate.Password, as: Password
  alias Rir.Repo
  alias Rir.User

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
    |> put_change(
         :crypted_password, hashed_password(changeset.params["password"])
       )
    |> repo.insert()
  end

  def destroy(id) do
    case Repo.get(User, id) do
      nil -> { :error, nil }
      user -> Repo.delete(user)
    end
  end

  def right_password?(password, encripted_password) do
    Password.is_password(password, encripted_password)
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(params \\ :empty) do
    %User{}
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email, on: User, downcase: true)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
  end

  defp hashed_password(password) do
    if is_bitstring(password) do
      Password.salt_and_hash(password)
    end
  end
end
