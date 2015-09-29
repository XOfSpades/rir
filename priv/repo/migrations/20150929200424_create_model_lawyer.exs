defmodule Rir.Repo.Migrations.CreateModelLawyer do
  use Ecto.Migration

  def change do
    create table(:lawyers) do
      add :first_name,    :string
      add :last_name,     :string
      add :email,         :string
      add :content,       :string

      timestamps
    end
  end
end
