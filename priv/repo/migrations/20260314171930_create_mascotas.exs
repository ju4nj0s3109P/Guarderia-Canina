defmodule Guarderia.Repo.Migrations.CreateMascotas do
  use Ecto.Migration

  def up do
    # Crear ENUM de forma segura
    execute("""
    DO $$
    BEGIN
      IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'especie_mascota') THEN
        CREATE TYPE especie_mascota AS ENUM ('perro', 'gato');
      END IF;
    END$$;
    """)

    # Crear tabla
    create table(:mascotas, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")
      add :nombre, :string, null: false
      add :raza, :string
      add :especie, :especie_mascota, null: false
      add :edad, :integer, null: false
      add :peso, :float
      add :tamano, :string
      add :vacunas_al_dia, :boolean, default: false
      add :esterilizado, :boolean
      add :comportamiento, :text
      add :foto_url, :string
      add :estado, :string, default: "pendiente_validacion", null: false
      add :cliente_id, references(:clientes, type: :uuid, on_delete: :delete_all), null: false
      timestamps()
    end

    # Índices
    create index(:mascotas, [:cliente_id])
    create index(:mascotas, [:estado])
  end

  def down do
    drop table(:mascotas)
    execute("DROP TYPE IF EXISTS especie_mascota")
  end
end
