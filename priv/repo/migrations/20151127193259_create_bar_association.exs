defmodule Rir.Repo.Migrations.CreateBarAssociation do
  use Ecto.Migration

  def change do
    create table(:bar_associations) do
      add :name, :string
      add :street, :string
      add :town, :string
      add :phone, :string
      add :fax, :string
      add :mail, :string
      add :web, :string
      add :impressum_id, :integer

      timestamps
    end

    alter table(:impressums) do
      remove :bar_association
    end
  end
end
