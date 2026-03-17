defmodule Guarderia.Repo.Migrations.CreateMensajesEnviados do
  use Ecto.Migration

  def change do
    create table(:mensajes_enviados, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :cliente_id, references(:clientes, type: :uuid, on_delete: :delete_all), null: false

      add :tipo, :string, null: false
      add :contenido, :text, null: false

      add :canal, :string, null: false

      add :estado, :string, default: "pendiente", null: false

      add :enviado_at, :utc_datetime
      add :error, :text

      timestamps()
    end

    create index(:mensajes_enviados, [:cliente_id])
    create index(:mensajes_enviados, [:estado])
    create index(:mensajes_enviados, [:tipo])
  end
end
