defmodule Libclusterplay do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    IO.puts "Start!"

    children = [
      worker(Libclusterplay.GlobalWorker, [])
    ]

    opts = [strategy: :one_for_one, name: Canvaserver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
