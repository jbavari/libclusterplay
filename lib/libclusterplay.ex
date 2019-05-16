defmodule Libclusterplay do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    IO.puts "Start!"

    children = [
      worker(Libclusterplay.GlobalWorker, [], id: :global_worker,
        name: :global_worker),
      {Cluster.Supervisor, [Application.get_env(:libcluster, :topologies), [name: Libclusterplay.ClusterSupervisor]]}
    ]

    opts = [strategy: :one_for_one, name: Libclusterplay]
    Supervisor.start_link(children, opts)
  end

  def cast_all_nodes(msg) do
    nodes = Node.list()
    all_nodes = nodes ++ [Node.self()]

    Enum.each(all_nodes, fn(node) ->
      GenServer.cast({:global, node}, {:global_worker, msg})
    end)

  end
end
