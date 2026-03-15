defmodule Guarderia.Repo.Migrations.CreateUpdatedAtTriggers do
  use Ecto.Migration

  def up do
    execute("""
    CREATE OR REPLACE FUNCTION actualizar_fecha()
    RETURNS TRIGGER AS $$
    BEGIN
      NEW.updated_at = NOW();
      RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;
    """)

    execute("""
    CREATE TRIGGER tr_roles_upd
    BEFORE UPDATE ON roles
    FOR EACH ROW
    EXECUTE PROCEDURE actualizar_fecha();
    """)

    execute("""
    CREATE TRIGGER tr_usuarios_upd
    BEFORE UPDATE ON usuarios
    FOR EACH ROW
    EXECUTE PROCEDURE actualizar_fecha();
    """)
  end

  def down do
    execute("DROP TRIGGER IF EXISTS tr_roles_upd ON roles;")
    execute("DROP TRIGGER IF EXISTS tr_usuarios_upd ON usuarios;")
    execute("DROP FUNCTION IF EXISTS actualizar_fecha();")
  end
end
