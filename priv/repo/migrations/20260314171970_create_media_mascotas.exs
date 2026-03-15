defmodule Guarderia.Repo.Migrations.CreateMediaMascotas do
  use Ecto.Migration

  def change do
    create table(:media_mascotas) do
      add :mascota_id, references(:mascotas)

      add :tipo, :string
      add :url, :text
      add :descripcion, :text
      add :visible_cliente, :boolean, default: true

      timestamps()
    end
  end
end
