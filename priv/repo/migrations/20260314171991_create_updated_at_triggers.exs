defmodule Guarderia.Repo.Migrations.CreateUpdatedAtTriggers do
  use Ecto.Migration

  def up do
    execute("""
    CREATE OR REPLACE FUNCTION set_updated_at()
    RETURNS TRIGGER AS $$
    BEGIN
      NEW.updated_at = NOW();
      RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;
    """)

    # 🔥 Lista de tablas con updated_at
    tablas = [
      "roles",
      "usuarios",
      "empleados",
      "clientes",
      "mascotas",
      "reservas",
      "servicios",
      "tarifas",
      "planes_servicio",
      "checkins",
      "pagos",
      "media_mascotas",
      "notificaciones",
      "recordatorios",
      "mensajes_enviados"
    ]

    Enum.each(tablas, fn tabla ->
      execute("""
      CREATE TRIGGER tr_#{tabla}_updated_at
      BEFORE UPDATE ON #{tabla}
      FOR EACH ROW
      EXECUTE FUNCTION set_updated_at();
      """)
    end)
  end

  def down do
    tablas = [
      "roles",
      "usuarios",
      "empleados",
      "clientes",
      "mascotas",
      "reservas",
      "servicios",
      "tarifas",
      "planes_servicio",
      "checkins",
      "pagos",
      "media_mascotas",
      "notificaciones",
      "recordatorios",
      "mensajes_enviados"
    ]

    Enum.each(tablas, fn tabla ->
      execute("DROP TRIGGER IF EXISTS tr_#{tabla}_updated_at ON #{tabla};")
    end)

    execute("DROP FUNCTION IF EXISTS set_updated_at();")
  end
end
