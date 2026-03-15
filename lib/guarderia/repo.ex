defmodule Guarderia.Repo do
  use Ecto.Repo,
    otp_app: :guarderia,
    adapter: Ecto.Adapters.Postgres
end
