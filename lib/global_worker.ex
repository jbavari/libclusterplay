defmodule Libclusterplay.GlobalWorker do
  use GenServer

  def start_link(opts \\ []) do
    IO.puts "Start GlobalWorker: #{inspect opts}"

    node_name = Node.self()
    GenServer.start_link(__MODULE__, [name: {:global, node_name}])
  end

  def init(opts \\ []) do
    IO.puts "init GlobalWorker: #{inspect opts}"
    {:ok, %{}}
  end

  def handle_info({:global_worker, msg}, state) do
    IO.puts "Got message: #{inspect msg}"
    {:noreply, state}
  end
end
