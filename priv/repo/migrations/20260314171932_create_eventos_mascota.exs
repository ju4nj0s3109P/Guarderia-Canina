defmodule Guarderia.Repo.Migrations.CreateEventosMascota do
  use Ecto.Migration

  def up do
    create table(:eventos_mascota, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")
      add :mascota_id, references(:mascotas, type: :uuid, on_delete: :delete_all), null: false
      add :tipo_evento, :string, null: false
      add :descripcion, :text
      add :fecha_evento, :utc_datetime, null: false
      add :estado, :string, default: "registrado", null: false
      add :empleado_id, references(:empleados, type: :uuid, on_delete: :nilify_all)
      add :origen, :string
      add :evidencia_url, :string
      timestamps()
    end

    create index(:eventos_mascota, [:mascota_id])
    create index(:eventos_mascota, [:fecha_evento])
    create index(:eventos_mascota, [:tipo_evento])
    create index(:eventos_mascota, [:mascota_id, :fecha_evento])
    create index(:eventos_mascota, [:mascota_id, :tipo_evento])
  end

  def down do
    drop table(:eventos_mascota)
  end
end
