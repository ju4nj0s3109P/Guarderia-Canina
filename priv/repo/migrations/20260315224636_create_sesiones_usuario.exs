defmodule Guarderia.Repo.Migrations.CreateSesionesUsuario do
  use Ecto.Migration

  def change do
    create table(:sesiones_usuario, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :usuario_id, references(:usuarios, type: :uuid, on_delete: :delete_all), null: false

      add :token, :binary, null: false
      add :expira_en, :utc_datetime, null: false

      add :ip, :inet
      add :dispositivo, :string

      add :activo, :boolean, default: true, null: false

      timestamps()
    end

    create index(:sesiones_usuario, [:usuario_id])
    create unique_index(:sesiones_usuario, [:token])
    create index(:sesiones_usuario, [:expira_en])
  end
end
