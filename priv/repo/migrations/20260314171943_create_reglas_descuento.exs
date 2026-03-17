defmodule Guarderia.Repo.Migrations.CreateReglasDescuento do
  use Ecto.Migration

  def change do
    create table(:reglas_descuento, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :min_dias, :integer, default: 0, null: false
      add :min_mascotas, :integer, default: 1, null: false

      add :porcentaje, :decimal, null: false

      add :estado, :string, default: "activo", null: false

      timestamps()
    end

    create index(:reglas_descuento, [:estado])
    create index(:reglas_descuento, [:min_dias])
    create index(:reglas_descuento, [:min_mascotas])
  end
end
