defmodule Guarderia.Repo.Migrations.CreateHistorialMedico do
  use Ecto.Migration

  def change do
    create table(:historial_medico) do
      add :mascota_id, references(:mascotas)
      add :vacunas, :text
      add :alergias, :text
      add :medicamentos, :text
      add :veterinario, :string
      add :notas, :text

      timestamps()
    end
  end
end
