defmodule Guarderia.Repo.Migrations.CreateRutasConductor do
  use Ecto.Migration

  def change do
    create table(:rutas_conductor, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :empleado_id, references(:empleados, type: :uuid, on_delete: :nilify_all)
      add :cliente_id, references(:clientes, type: :uuid, on_delete: :nilify_all)
      add :reserva_id, references(:reservas, type: :uuid, on_delete: :delete_all)

      add :direccion, :text
      add :latitud, :decimal
      add :longitud, :decimal

      add :estado, :string, default: "pendiente", null: false
      add :orden, :integer

      add :fecha_hora, :utc_datetime

      timestamps()
    end

    create index(:rutas_conductor, [:empleado_id])
    create index(:rutas_conductor, [:reserva_id])
    create index(:rutas_conductor, [:fecha_hora])
  end
end
