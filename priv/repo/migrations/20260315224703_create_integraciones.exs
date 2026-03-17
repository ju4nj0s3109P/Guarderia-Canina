defmodule Guarderia.Repo.Migrations.CreateIntegraciones do
  use Ecto.Migration

  def change do
    create table(:integraciones, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :nombre, :string, null: false
      add :tipo, :string, null: false

      # 🔐 Mejor guardar config completa (tokens, urls, etc)
      add :config, :map

      add :activo, :boolean, default: true, null: false

      timestamps()
    end

    create unique_index(:integraciones, [:nombre])
    create index(:integraciones, [:tipo])
  end
end
