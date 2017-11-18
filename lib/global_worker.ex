defmodule Libclusterplay.GlobalWorker do
  use GenServer

  def start_link(opts \\ []) do
    IO.puts "Start GlobalWorker: #{inspect opts}"

    node_name = Node.self()
    IO.puts "Node name: #{inspect node_name}"
    GenServer.start_link(__MODULE__, [], [name: {:global, node_name}])
    # GenServer.start_link(__MODULE__, [], [name: :getem])
  end

  def init(opts \\ []) do
    IO.puts "init GlobalWorker: #{inspect opts}"
    IO.inspect Process.info(self())
    {:ok, []}
  end

  def handle_call({:global_worker, msg}, _from, state) do
    IO.puts "Got message: #{inspect msg}"
    new_state = state ++ [msg]
    # GenServer.cast({:global, :"mac@192.168.3.101"}, {:global_worker, "asdf"})
    {:reply, new_state, new_state}
  end

  def handle_cast({:global_worker, msg}, state) do
    IO.puts "Got message: #{inspect msg}"
    new_state = state ++ [msg]
    {:noreply, new_state}
  end
end
