defmodule Convo do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(Convo.Endpoint, []),
      worker(Task.Supervisor, [[name: Convo.MP3Uploader, restart: :transient, strategy: :one_for_one, max_seconds: 1, max_restarts: 10]])
      # Start your own worker by calling: Convo.Worker.start_link(arg1, arg2, arg3)
      # worker(Convo.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Convo.Supervisor, max_seconds: 30, max_restarts: 10]

    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Convo.Endpoint.config_change(changed, removed)
    :ok
  end
end
