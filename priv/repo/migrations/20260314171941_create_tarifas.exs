defmodule Guarderia.Repo.Migrations.CreateTarifas do
  use Ecto.Migration

  def change do
    create table(:tarifas) do
      add :servicio_id, references(:servicios)
      add :precio_dia, :decimal
      add :precio_hora, :decimal
      add :moneda, :string
      add :activo, :boolean, default: true

      timestamps()
    end
  end
end
