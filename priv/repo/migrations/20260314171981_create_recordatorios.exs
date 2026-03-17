defmodule Guarderia.Repo.Migrations.CreateRecordatorios do
  use Ecto.Migration

  def change do
    create table(:recordatorios, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :mensaje, :string, null: false
      add :fecha_recordatorio, :utc_datetime, null: false

      add :estado, :string, default: "pendiente", null: false

      add :cliente_id, references(:clientes, type: :uuid, on_delete: :delete_all), null: false
      add :mascota_id, references(:mascotas, type: :uuid, on_delete: :delete_all)

      add :enviado_at, :utc_datetime

      timestamps()
    end

    create index(:recordatorios, [:cliente_id])
    create index(:recordatorios, [:mascota_id])
    create index(:recordatorios, [:estado])
    create index(:recordatorios, [:fecha_recordatorio])
  end
end
