defmodule Guarderia.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      GuarderiaWeb.Telemetry,
      Guarderia.Repo,
      {DNSCluster, query: Application.get_env(:guarderia, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Guarderia.PubSub},
      # Start a worker by calling: Guarderia.Worker.start_link(arg)
      # {Guarderia.Worker, arg},
      # Start to serve requests, typically the last entry
      GuarderiaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Guarderia.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GuarderiaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
