defmodule Rir.Repo.Migrations.AddLiabilityInsuranceTable do
  use Ecto.Migration

  def change do
    create table(:liability_insurances) do
      add :name, :string
      add :street, :string
      add :postal_code, :string
      add :town, :string
      add :phone, :string
      add :mail, :string
      add :impressum_id, :integer

      timestamps
    end

    alter table(:impressums) do
      remove :liability_insurance
    end
  end
end
