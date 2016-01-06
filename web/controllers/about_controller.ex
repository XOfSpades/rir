defmodule Rir.AboutController do
  use Rir.Web, :controller
  alias Rir.Repo
  alias Rir.Impressum

  def index(conn, _params) do
    impressums = Repo.all(Impressum)
                   |> Repo.preload [:bar_association, :liability_insurance]
    render conn, "index.html", impressum: first_impressum(impressums)
  end

  defp first_impressum([]) do
    %Impressum{
      bar_association: %Rir.BarAssociation{},
      liability_insurance: %Rir.LiabilityInsurance{}
    }
  end
  defp first_impressum([impressum | _]), do: impressum
end
