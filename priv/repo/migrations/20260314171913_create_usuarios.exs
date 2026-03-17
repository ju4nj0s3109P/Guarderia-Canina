defmodule Guarderia.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :email, :string, null: false
      add :password_hash, :string, null: false
      add :nombre_completo, :string, null: false
      add :telefono, :string
      add :cedula, :string

      add :role_id, references(:roles, type: :uuid, on_delete: :nilify_all)

      add :estado, :string, default: "activo", null: false
      add :confirmado_at, :utc_datetime
      add :ultimo_login_at, :utc_datetime
      add :ultimo_ip, :string

      timestamps()
    end

    create unique_index(:usuarios, ["lower(email)"])
    create index(:usuarios, [:role_id])
  end
end
