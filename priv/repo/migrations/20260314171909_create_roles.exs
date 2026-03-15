defmodule Guarderia.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :nombre, :string, null: false
      add :descripcion, :text

      timestamps()
    end

    create unique_index(:roles, [:nombre])
  end
end
