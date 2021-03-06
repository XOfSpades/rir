defmodule Rir.Article do
  import Ecto.Query
  use Rir.Web, :model
  alias Rir.Repo
  alias Ecto.Changeset

  schema "articles" do
    field :header, :string
    field :content, :string
    field :hot_topic, :boolean

    timestamps
  end

  @required_fields [:header, :content, :hot_topic]
  @optional_fields ~w()

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
    case Repo.get(Rir.Article, id) do
      nil -> { :error, nil }
      article -> Repo.delete(article)
    end
  end

  def hot_topics do
    query = from a in Rir.Article, where: a.hot_topic == true
    Repo.all(query)
  end
end
