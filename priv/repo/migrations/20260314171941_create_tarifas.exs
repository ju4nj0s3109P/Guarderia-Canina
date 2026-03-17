defmodule Guarderia.Repo.Migrations.CreateTarifas do
  use Ecto.Migration

  def change do
    create table(:tarifas, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :servicio_id, references(:servicios, type: :uuid, on_delete: :delete_all), null: false

      add :precio_dia, :decimal
      add :precio_hora, :decimal
      add :moneda, :string, default: "COP", null: false

      add :estado, :string, default: "activo", null: false

      timestamps()
    end

    create index(:tarifas, [:servicio_id])
    create index(:tarifas, [:estado])

    create unique_index(:tarifas, [:servicio_id, :moneda], where: "estado = 'activo'")
  end
end
