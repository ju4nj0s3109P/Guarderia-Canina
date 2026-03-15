defmodule Guarderia.Repo.Migrations.CreateIntegraciones do
  use Ecto.Migration

  def change do
    create table(:integraciones) do
      add :nombre, :string
      add :tipo, :string
      add :api_key, :text
      add :activo, :boolean, default: true

      timestamps()
    end
  end
end
