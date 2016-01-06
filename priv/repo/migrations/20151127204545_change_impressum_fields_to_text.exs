defmodule Rir.Repo.Migrations.ChangeImpressumFieldsToText do
  use Ecto.Migration

  def change do
    alter table(:impressums) do
      modify :lawyer_info, :text
      modify :liability_insurance, :text
      modify :additional_information, :text
      modify :copyright, :text
    end
  end
end
