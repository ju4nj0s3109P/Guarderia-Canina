defmodule Guarderia.Repo.Migrations.CreateContactosEmergencia do
  use Ecto.Migration

  def change do
    create table(:contactos_emergencia) do
      add :cliente_id, references(:clientes)
      add :nombre, :string
      add :telefono, :string
      add :relacion, :string

      timestamps()
    end
  end
end
