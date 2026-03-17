defmodule Guarderia.Repo.Migrations.CreateNotificaciones do
  use Ecto.Migration

  def change do
    create table(:notificaciones, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :cliente_id, references(:clientes, type: :uuid, on_delete: :delete_all), null: false

      add :tipo, :string, null: false
      add :mensaje, :text, null: false

      add :canal, :string, null: false

      add :estado, :string, default: "pendiente", null: false

      add :enviado_at, :utc_datetime
      add :leido_at, :utc_datetime

      timestamps()
    end

    create index(:notificaciones, [:cliente_id])
    create index(:notificaciones, [:estado])
    create index(:notificaciones, [:tipo])
  end
end
