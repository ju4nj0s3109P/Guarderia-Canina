defmodule Guarderia.Repo.Migrations.CreateEventosMascota do
  use Ecto.Migration

  def change do
    create table(:eventos_mascota) do
      add :mascota_id, references(:mascotas, type: :uuid, on_delete: :delete_all)
      add :tipo, :string
      add :descripcion, :text
      add :fecha_evento, :utc_datetime
      add :empleado_id, references(:empleados, type: :uuid)

      timestamps()
    end

    create index(:eventos_mascota, [:mascota_id])
  end
end
