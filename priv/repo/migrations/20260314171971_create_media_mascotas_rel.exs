defmodule Guarderia.Repo.Migrations.CreateMediaMascotasRel do
  use Ecto.Migration

  def change do
    create table(:media_mascotas_rel, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :media_id, references(:media_mascotas, type: :uuid, on_delete: :delete_all), null: false
      add :mascota_id, references(:mascotas, type: :uuid, on_delete: :delete_all), null: false

      timestamps()
    end

    create unique_index(:media_mascotas_rel, [:media_id, :mascota_id])
    create index(:media_mascotas_rel, [:media_id])
    create index(:media_mascotas_rel, [:mascota_id])
  end
end
