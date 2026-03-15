defmodule Guarderia.Repo.Migrations.CreateRolesPermisos do
  use Ecto.Migration

  def change do
    create table(:roles_permisos, primary_key: false) do
      add :role_id, references(:roles, on_delete: :delete_all)
      add :permiso_id, references(:permisos, on_delete: :delete_all)
    end

    create unique_index(:roles_permisos, [:role_id, :permiso_id])
  end
end
