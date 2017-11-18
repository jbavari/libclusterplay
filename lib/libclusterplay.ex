defmodule Libclusterplay do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    IO.puts "Start!"

    children = [
      worker(Libclusterplay.GlobalWorker, [], id: :global_worker,
        name: :global_worker)
    ]

    opts = [strategy: :one_for_one, name: Libclusterplay]
    Supervisor.start_link(children, opts)
  end
end
