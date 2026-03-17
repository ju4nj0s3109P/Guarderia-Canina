defmodule Guarderia.Repo.Migrations.CreateSucursales do
  use Ecto.Migration

  def change do
    create table(:sucursales, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :nombre, :string, null: false
      add :direccion, :string, null: false
      add :telefono, :string

      add :activo, :boolean, default: true, null: false

      timestamps()
    end

    create unique_index(:sucursales, [:nombre])
  end
end
