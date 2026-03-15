defmodule Guarderia.Repo.Migrations.CreateServicios do
  use Ecto.Migration

  def change do
    create table(:servicios) do
      add :nombre, :string
      add :descripcion, :text
      add :color, :string

      timestamps()
    end
  end
end
