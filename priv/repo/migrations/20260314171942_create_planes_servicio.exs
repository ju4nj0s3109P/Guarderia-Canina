defmodule Guarderia.Repo.Migrations.CreatePlanesServicio do
  use Ecto.Migration

  def change do
    create table(:planes_servicio) do
      add :nombre, :string, null: false
      add :descripcion, :text
      add :precio, :decimal, null: false
      add :duracion_dias, :integer, null: false

      add :servicio_id, references(:servicios, on_delete: :delete_all)

      timestamps()
    end

    create index(:planes_servicio, [:servicio_id])
  end
end
