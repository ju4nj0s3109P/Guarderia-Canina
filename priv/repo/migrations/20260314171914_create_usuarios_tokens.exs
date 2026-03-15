defmodule Guarderia.Repo.Migrations.CreateUsuariosTokens do
  use Ecto.Migration

  def change do
    create table(:usuarios_tokens) do
      add :usuario_id, references(:usuarios, type: :uuid, on_delete: :delete_all)
      add :token, :binary
      add :contexto, :string
      add :sent_to, :string

      timestamps(updated_at: false)
    end

    create index(:usuarios_tokens, [:usuario_id])
    create unique_index(:usuarios_tokens, [:contexto, :token])
  end
end
