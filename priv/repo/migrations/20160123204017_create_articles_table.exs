defmodule Rir.Repo.Migrations.CreateArticlesTable do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :header,    :string
      add :content,   :string

      timestamps
    end
  end
end
