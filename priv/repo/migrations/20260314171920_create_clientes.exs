defmodule Guarderia.Repo.Migrations.CreateClientes do
  use Ecto.Migration

  def change do
    create table(:clientes) do
      add :nombre, :string, null: false
      add :telefono, :string
      add :email, :string
      add :direccion, :string
      add :notas, :text

      timestamps()
    end
  end
end
