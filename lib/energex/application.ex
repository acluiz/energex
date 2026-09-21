defmodule Energex.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EnergexWeb.Telemetry,
      Energex.Repo,
      {DNSCluster, query: Application.get_env(:energex, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Energex.PubSub},
      # Start a worker by calling: Energex.Worker.start_link(arg)
      # {Energex.Worker, arg},
      # Start to serve requests, typically the last entry
      EnergexWeb.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Energex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EnergexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
