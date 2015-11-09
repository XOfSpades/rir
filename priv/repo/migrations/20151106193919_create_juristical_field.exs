defmodule Rir.Repo.Migrations.CreateJuristicalField do
  use Ecto.Migration

  def change do
    create table(:juristical_fields) do
      add :label, :string

      timestamps
    end

    create unique_index :juristical_fields,
                        [:label],
                        name: :juristical_fields_label_index
  end
end
