defmodule Guarderia.Repo.Migrations.CreateRolesPermisos do
  use Ecto.Migration

  def change do
    create table(:roles_permisos, primary_key: false) do
      add :role_id, references(:roles, type: :uuid, on_delete: :delete_all)
      add :permiso_id, references(:permisos, type: :uuid, on_delete: :delete_all)

      timestamps(updated_at: false)
    end

    create unique_index(:roles_permisos, [:role_id, :permiso_id])

    create index(:roles_permisos, [:role_id])
    create index(:roles_permisos, [:permiso_id])
  end
end
