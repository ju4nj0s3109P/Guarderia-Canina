defmodule Guarderia.Repo.Migrations.CreateMediaMascotas do
  use Ecto.Migration

  def change do
    create table(:media_mascotas, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :mascota_id, references(:mascotas, type: :uuid, on_delete: :delete_all), null: false

      add :tipo, :string, null: false
      add :url, :text, null: false
      add :descripcion, :text

      add :visible_cliente, :boolean, default: true
      add :estado, :string, default: "activo", null: false

      timestamps()
    end

    create index(:media_mascotas, [:mascota_id])
    create index(:media_mascotas, [:estado])
    create index(:media_mascotas, [:tipo])
  end
end
