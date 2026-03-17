defmodule Guarderia.Repo.Migrations.CreateContactosEmergencia do
  use Ecto.Migration

  def change do
    create table(:contactos_emergencia, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :cliente_id, references(:clientes, type: :uuid, on_delete: :delete_all), null: false

      add :nombre, :string, null: false
      add :telefono, :string, null: false
      add :relacion, :string

      add :prioridad, :integer, default: 1
      add :recibe_notificaciones, :boolean, default: true

      timestamps()
    end

    create index(:contactos_emergencia, [:cliente_id])
    create unique_index(:contactos_emergencia, [:cliente_id, :telefono])
  end
end
