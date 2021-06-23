defmodule Enigma.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Enigma.Worker.start_link(arg)
      {DynamicSupervisor, strategy: :one_for_one, name: :sup}
      # {Enigma, {nil, :bruce}},
      # {Enigma, {nil, :veera}},
      # {Enigma, {nil, :brad}},
      # {Enigma, {nil, :marcos}},
      # {Enigma, {nil, :nariman}}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :rest_for_one, name: Enigma.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
