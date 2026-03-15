defmodule Guarderia.Repo.Migrations.CreatePermisos do
  use Ecto.Migration

  def change do
    create table(:permisos) do
      add :codigo, :string, null: false
      add :descripcion, :text

      timestamps(updated_at: false)
    end

    create unique_index(:permisos, [:codigo])
  end
end
