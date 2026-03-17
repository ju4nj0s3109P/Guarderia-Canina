defmodule Guarderia.Repo.Migrations.CreatePermisos do
  use Ecto.Migration

  def change do
    create table(:permisos, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")
      add :codigo, :string, null: false
      add :modulo, :string, null: false
      add :descripcion, :text

      timestamps() # inserted_at + updated_at
    end

    create unique_index(:permisos, ["lower(codigo)"])
  end
end
