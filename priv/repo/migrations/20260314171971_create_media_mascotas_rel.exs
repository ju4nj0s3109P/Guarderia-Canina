defmodule Guarderia.Repo.Migrations.CreateMediaMascotasRel do
  use Ecto.Migration

  def change do
    create table(:media_mascotas_rel) do
      add :media_id, references(:media_mascotas, type: :uuid)
      add :mascota_id, references(:mascotas, type: :uuid)

      timestamps()
    end

    create index(:media_mascotas_rel, [:media_id])
  end
end
