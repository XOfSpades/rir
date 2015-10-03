defmodule Rir.Repo.Migrations.RenameLawyerToMember do
  use Ecto.Migration

  def change do
    rename table(:lawyers), to: table(:members)
  end
end
