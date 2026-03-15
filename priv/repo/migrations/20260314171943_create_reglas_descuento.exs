defmodule Guarderia.Repo.Migrations.CreateReglasDescuento do
  use Ecto.Migration

  def change do
    create table(:reglas_descuento) do
      add :min_dias, :integer
      add :min_mascotas, :integer
      add :porcentaje, :decimal

      timestamps()
    end
  end
end
