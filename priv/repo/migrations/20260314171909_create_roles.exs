defmodule Guarderia.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :nombre, :string, null: false
      add :descripcion, :text

      timestamps()
    end

    create unique_index(:roles, ["lower(nombre)"])
  end
end
