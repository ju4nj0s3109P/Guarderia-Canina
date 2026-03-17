defmodule Guarderia.Repo.Migrations.CreatePlanesServicio do
  use Ecto.Migration

  def change do
    create table(:planes_servicio, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :nombre, :string, null: false
      add :descripcion, :text

      add :precio, :decimal, null: false
      add :moneda, :string, default: "COP", null: false

      add :duracion_dias, :integer, null: false

      add :estado, :string, default: "activo", null: false

      add :servicio_id, references(:servicios, type: :uuid, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:planes_servicio, [:servicio_id])
    create index(:planes_servicio, [:estado])

    create unique_index(:planes_servicio, ["lower(nombre)", :servicio_id])
  end
end
