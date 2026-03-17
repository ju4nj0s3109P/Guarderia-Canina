defmodule Guarderia.Repo.Migrations.CreateEmpleados do
  use Ecto.Migration

  def change do
    create table(:empleados, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :usuario_id, references(:usuarios, type: :uuid, on_delete: :delete_all), null: false

      add :cargo, :string
      add :salario, :decimal
      add :fecha_contratacion, :date

      add :activo, :boolean, default: true

      timestamps()
    end

    create unique_index(:empleados, [:usuario_id])

  end
end
