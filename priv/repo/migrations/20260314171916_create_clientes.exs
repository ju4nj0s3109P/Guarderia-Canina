defmodule Guarderia.Repo.Migrations.CreateClientes do
  use Ecto.Migration

  def change do
    create table(:clientes, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :usuario_id, references(:usuarios, type: :uuid, on_delete: :delete_all), null: false

      add :direccion, :string
      add :notas, :text

      timestamps()
    end

    create unique_index(:clientes, [:usuario_id])

  end
end
