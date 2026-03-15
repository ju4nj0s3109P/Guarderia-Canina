defmodule Guarderia.Repo.Migrations.CreateRutasConductor do
  use Ecto.Migration

  def change do
    create table(:rutas_conductor) do
      add :empleado_id, references(:empleados, type: :uuid)
      add :cliente_id, references(:clientes, type: :uuid)
      add :reserva_id, references(:reservas, type: :uuid)

      add :direccion, :text
      add :estado, :string
      add :fecha, :date

      timestamps()
    end

    create index(:rutas_conductor, [:empleado_id])
  end
end
