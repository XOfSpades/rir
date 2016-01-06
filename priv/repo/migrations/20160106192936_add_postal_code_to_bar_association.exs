defmodule Rir.Repo.Migrations.AddPostalCodeToBarAssociation do
  use Ecto.Migration

  def change do
    alter table(:bar_associations) do
      add :postal_code, :string
    end
  end
end
