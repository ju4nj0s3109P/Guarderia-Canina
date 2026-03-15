defmodule Guarderia.Repo.Migrations.CreateRecordatorios do
  use Ecto.Migration

  def change do
    create table(:recordatorios) do
      add :mensaje, :string, null: false
      add :fecha_recordatorio, :utc_datetime, null: false
      add :enviado, :boolean, default: false

      add :cliente_id, references(:clientes, on_delete: :delete_all)
      add :mascota_id, references(:mascotas, on_delete: :delete_all)

      timestamps()
    end

    create index(:recordatorios, [:cliente_id])
    create index(:recordatorios, [:mascota_id])
  end
end
