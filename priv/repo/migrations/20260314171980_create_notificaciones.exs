defmodule Guarderia.Repo.Migrations.CreateNotificaciones do
  use Ecto.Migration

  def change do
    create table(:notificaciones) do
      add :cliente_id, references(:clientes)

      add :tipo, :string
      add :mensaje, :text
      add :estado, :string
      add :enviado_at, :utc_datetime

      timestamps()
    end
  end
end
