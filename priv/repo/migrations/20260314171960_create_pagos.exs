defmodule Guarderia.Repo.Migrations.CreatePagos do
  use Ecto.Migration

  def change do
    create table(:pagos) do
      add :cliente_id, references(:clientes)
      add :reserva_id, references(:reservas)

      add :monto, :decimal
      add :metodo_pago, :string
      add :estado, :string
      add :referencia_pago, :string

      timestamps()
    end
  end
end
