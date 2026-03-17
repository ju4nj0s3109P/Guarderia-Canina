defmodule Guarderia.Repo.Migrations.SeedInitialRoles do
  use Ecto.Migration

  def up do
    execute("""
    INSERT INTO roles (id, nombre, descripcion, inserted_at, updated_at)
    VALUES (gen_random_uuid(), 'admin', 'Super Usuario', NOW(), NOW())
    ON CONFLICT (lower(nombre)) DO NOTHING
    """)

    execute("""
    INSERT INTO permisos (id, codigo, modulo, descripcion, inserted_at, updated_at)
    VALUES (gen_random_uuid(), 'all:access', 'global', 'Acceso total', NOW(), NOW())
    ON CONFLICT (lower(codigo)) DO NOTHING;
    """)

    execute("""
    INSERT INTO roles_permisos (role_id, permiso_id, inserted_at)
    SELECT r.id, p.id, NOW()
    FROM roles r, permisos p
    WHERE lower(r.nombre) = 'admin' AND lower(p.codigo) = 'all:access'
    ON CONFLICT DO NOTHING;
    """)
  end

  def down do
    execute("""
    DELETE FROM roles_permisos
    WHERE rol_id IN (SELECT id FROM roles WHERE nombre = 'admin');
    """)

    execute("""
    DELETE FROM permisos WHERE codigo = 'all:access';
    """)

    execute("""
    DELETE FROM roles WHERE nombre = 'admin';
    """)
  end
end
