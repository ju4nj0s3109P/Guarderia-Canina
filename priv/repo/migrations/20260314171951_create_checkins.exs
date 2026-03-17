defmodule Guarderia.Repo.Migrations.CreateCheckins do
  use Ecto.Migration

  def change do
    create table(:checkins, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :mascota_id, references(:mascotas, type: :uuid, on_delete: :delete_all), null: false
      add :reserva_id, references(:reservas, type: :uuid, on_delete: :delete_all), null: false

      add :fecha_entrada, :utc_datetime, null: false
      add :fecha_salida, :utc_datetime

      add :estado, :string, default: "activo", null: false

      add :notas, :text

      timestamps()
    end

    create index(:checkins, [:mascota_id])
    create index(:checkins, [:reserva_id])
    create index(:checkins, [:estado])
  end
end
