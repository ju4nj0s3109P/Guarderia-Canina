defmodule Guarderia.Repo.Migrations.CreateSucursales do
  use Ecto.Migration

  def change do
    create table(:sucursales) do
      add :nombre, :string
      add :direccion, :string
      add :telefono, :string

      timestamps()
    end
  end
end
