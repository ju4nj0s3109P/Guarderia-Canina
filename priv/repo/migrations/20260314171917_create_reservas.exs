defmodule Guarderia.Repo.Migrations.CreateReservas do
  use Ecto.Migration

  def change do
    create table(:reservas, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :cliente_id, references(:clientes, type: :uuid, on_delete: :delete_all), null: false

      add :fecha_inicio, :utc_datetime, null: false
      add :fecha_fin, :utc_datetime, null: false

      add :estado, :string, default: "pendiente", null: false

      add :total, :decimal, default: 0
      add :descuento, :decimal, default: 0
      add :total_final, :decimal, default: 0

      add :notas, :text

      timestamps()
    end

    create index(:reservas, [:cliente_id])
    create index(:reservas, [:estado])
    create index(:reservas, [:fecha_inicio])
  end
end
