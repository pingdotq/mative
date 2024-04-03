defmodule Mative.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MativeWeb.Telemetry,
      # Start the Ecto repository
      Mative.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mative.PubSub},
      # Start Finch
      {Finch, name: Mative.Finch},
      # Start the Endpoint (http/https)
      MativeWeb.Endpoint
      # Start a worker by calling: Mative.Worker.start_link(arg)
      # {Mative.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mative.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MativeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
