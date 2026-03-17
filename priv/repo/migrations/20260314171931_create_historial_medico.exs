defmodule Guarderia.Repo.Migrations.CreateHistorialMedico do
  use Ecto.Migration

  def change do
    create table(:historial_medico, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :mascota_id, references(:mascotas, type: :uuid, on_delete: :delete_all), null: false

      add :vacunas, :text, null: false
      add :alergias, :text
      add :medicamentos, :text
      add :veterinario, :string
      add :notas, :text

      add :fecha_revision, :utc_datetime
      add :estado, :string, default: "activo", null: false

      add :archivo_url, :string

      timestamps()
    end

    create index(:historial_medico, [:mascota_id])
  end
end
