defmodule Guarderia.Repo.Migrations.SeedInitialRoles do
  use Ecto.Migration

  def up do
    execute("""
    INSERT INTO roles (nombre, descripcion, inserted_at, updated_at)
    VALUES ('admin', 'Super Usuario', NOW(), NOW());
    """)


    execute("""
    INSERT INTO permisos (codigo, descripcion, inserted_at)
    VALUES ('all:access', 'Acceso total', NOW());
    """)
  end

  def down do
    execute("DELETE FROM roles_permisos;")
    execute("DELETE FROM permisos;")
    execute("DELETE FROM roles;")
  end
end
