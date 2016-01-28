defmodule Rir.Repo.Migrations.AdaptArticlesToTest do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      modify :content, :text
    end
  end
end
