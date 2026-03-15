defmodule Guarderia.Repo.Migrations.CreateReservas do
  use Ecto.Migration

  def change do
    create table(:reservas) do
      add :mascota_id, references(:mascotas)
      add :servicio_id, references(:servicios)

      add :fecha_inicio, :date
      add :fecha_fin, :date
      add :estado, :string

      timestamps()
    end
  end
end
