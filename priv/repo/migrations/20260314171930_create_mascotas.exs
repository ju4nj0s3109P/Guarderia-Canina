defmodule Guarderia.Repo.Migrations.CreateMascotas do
  use Ecto.Migration

  def change do
    execute("CREATE TYPE especie_mascota AS ENUM ('perro', 'gato')")

    create table(:mascotas) do
      add :nombre, :string, null: false
      add :raza, :string
      add :especie, :especie_mascota, null: false
      add :edad, :integer
      add :peso, :float
      add :cliente_id, references(:clientes)


      timestamps()
    end
  end
end
