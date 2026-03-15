defmodule Guarderia.Repo.Migrations.CreateCheckins do
  use Ecto.Migration

  def change do
    create table(:checkins) do
      add :mascota_id, references(:mascotas)
      add :servicio_id, references(:servicios)

      add :fecha, :date
      add :hora_entrada, :time
      add :hora_salida, :time
      add :estado, :string

      timestamps()
    end
  end
end
