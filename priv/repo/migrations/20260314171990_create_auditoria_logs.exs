defmodule Guarderia.Repo.Migrations.CreateAuditoriaLogs do
  use Ecto.Migration

  def change do
    create table(:auditoria_logs, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :usuario_id, references(:usuarios, type: :uuid, on_delete: :nilify_all)

      add :accion, :string, null: false
      add :tabla_nombre, :string, null: false
      add :registro_id, :uuid

      add :datos_anteriores, :map
      add :datos_nuevos, :map

      add :ip_cliente, :inet

      timestamps(updated_at: false)
    end

    create index(:auditoria_logs, [:usuario_id])
    create index(:auditoria_logs, [:tabla_nombre])
    create index(:auditoria_logs, [:registro_id])
  end
end
