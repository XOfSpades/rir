defmodule Rir.Repo.Migrations.CreateImpressum do
  use Ecto.Migration

  def change do
    create table(:impressums) do
      add :guarantor, :string
      add :turnover_tax_nr, :string
      add :fax, :string
      add :phone, :string
      add :street, :string
      add :town, :string
      add :mail, :string
      add :web, :string
      add :turnover_tax_id, :string
      add :lawyer_info, :string
      add :bar_association, :string
      add :liability_insurance, :string
      add :additional_information, :string
      add :copyright, :string

      timestamps
    end

  end
end
