defmodule Rir.AboutController do
  use Rir.Web, :controller
  alias Rir.Impressum

  def index(conn, _params) do
    impressums = Rir.Repo.all(Impressum)
    render conn, "index.html", impressum: first_impressum(impressums)
  end

  defp first_impressum([]), do: %Impressum{}
  defp first_impressum([impressum | _]), do: impressum
end
