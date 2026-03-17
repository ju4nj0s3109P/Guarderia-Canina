defmodule Guarderia.Repo.Migrations.CreatePagos do
  use Ecto.Migration

  def change do
    create table(:pagos, primary_key: false) do
      add :id, :uuid, primary_key: true, default: fragment("gen_random_uuid()")

      add :cliente_id, references(:clientes, type: :uuid, on_delete: :nilify_all)
      add :reserva_id, references(:reservas, type: :uuid, on_delete: :delete_all), null: false

      add :monto, :decimal, null: false
      add :moneda, :string, default: "COP", null: false

      add :metodo_pago, :string, null: false
      add :estado, :string, default: "pendiente", null: false

      add :referencia_pago, :string

      add :fecha_pago, :utc_datetime

      timestamps()
    end

    create index(:pagos, [:cliente_id])
    create index(:pagos, [:reserva_id])
    create index(:pagos, [:estado])

    create unique_index(:pagos, [:referencia_pago])
  end
end
