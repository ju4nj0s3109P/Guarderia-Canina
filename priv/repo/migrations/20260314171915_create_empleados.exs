defmodule Guarderia.Repo.Migrations.CreateEmpleados do
  use Ecto.Migration

  def change do
    create table(:empleados) do
      add :nombre, :string
      add :email, :string
      add :telefono, :string
      add :rol, :string
      add :activo, :boolean, default: true

      timestamps()
    end

    create unique_index(:empleados, [:email])
  end
end
