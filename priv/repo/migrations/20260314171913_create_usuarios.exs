defmodule Guarderia.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :nombre_completo, :string, null: false
      add :role_id, references(:roles, on_delete: :nilify_all)

      add :activo, :boolean, default: true
      add :confirmado_at, :utc_datetime
      add :ultimo_login_at, :utc_datetime

      timestamps()
    end

    create unique_index(:usuarios, [:email])
  end
end
