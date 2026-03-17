defmodule Guarderia.Repo.Migrations.CreateServicios do
  use Ecto.Migration

  def change do
    create table(:servicios, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :nombre, :string, null: false
      add :descripcion, :text

      add :precio_base, :decimal, null: false
      add :duracion_minutos, :integer

      add :color, :string

      add :estado, :string, default: "activo", null: false

      timestamps()
    end

    create unique_index(:servicios, ["lower(nombre)"])
    create index(:servicios, [:estado])
  end
end
