defmodule Guarderia.Repo.Migrations.CreateAuditoriaLogs do
  use Ecto.Migration

  def change do
    create table(:auditoria_logs) do
      add :usuario_id, references(:usuarios, type: :uuid, on_delete: :nilify_all)
      add :operacion, :string
      add :tabla_nombre, :string
      add :registro_id, :uuid
      add :datos_anteriores, :map
      add :datos_nuevos, :map
      add :ip_cliente, :inet

      timestamps(updated_at: false)
    end
  end
end
