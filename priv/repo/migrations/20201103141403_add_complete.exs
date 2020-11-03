defmodule TodoApi.Repo.Migrations.AddComplete do
  use Ecto.Migration

  def change do
    alter table (:todos) do
      add :is_complete, :boolean
    end
  end
end
