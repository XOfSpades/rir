defmodule Rir.AboutController do
  use Rir.Web, :controller
  alias Rir.Impressum
  alias Rir.BarAssociation
  alias Rir.Repo

  def index(conn, _params) do
    impressums = Repo.all(Impressum) |> Repo.preload [:bar_association]
    render conn, "index.html", impressum: first_impressum(impressums)
  end

  defp first_impressum([]), do: %Impressum{bar_association: %BarAssociation{}}
  defp first_impressum([impressum | _]), do: impressum
end
