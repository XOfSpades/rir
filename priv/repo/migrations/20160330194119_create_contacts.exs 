defmodule Rir.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :header,      :string
      add :message,     :text
      add :phone,       :string
      add :email,       :string
      add :first_name,  :string
      add :last_name,   :string

      timestamps
    end
  end
end
