defmodule Guarderia.Repo.Migrations.CreateSesionesUsuario do
  use Ecto.Migration

  def change do
    create table(:sesiones_usuario) do
      add :usuario_id, references(:usuarios, type: :uuid)
      add :token, :binary
      add :expira_en, :utc_datetime
      add :ip, :string
      add :dispositivo, :string

      timestamps()
    end

    create index(:sesiones_usuario, [:usuario_id])
  end
end
