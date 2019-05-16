# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# config :libcluster,
#   topologies: [
#     example: [
#       # The selected clustering strategy. Required.
#       strategy: Cluster.Strategy.Epmd,
#       # Configuration for the provided strategy. Optional.
#       config: [hosts: [:"a@127.0.0.1", :"b@127.0.0.1"]],
#       # The function to use for connecting nodes. The node
#       # name will be appended to the argument list. Optional
#       connect: {:net_kernel, :connect, []},
#       # The function to use for disconnecting nodes. The node
#       # name will be appended to the argument list. Optional
#       disconnect: {:net_kernel, :disconnect, []},
#       # The function to use for listing nodes.
#       # This function must return a list of node names. Optional
#       list_nodes: {:erlang, :nodes, [:connected]},
#       # A list of options for the supervisor child spec
#       # of the selected strategy. Optional
#       child_spec: [restart: :transient]
#     ]
#   ]

config :libcluster,
  debug: true,
  topologies: [
    gossip_example: [
      strategy: Cluster.Strategy.Gossip,
      config: [
        port: 45892,
        if_addr: {0,0,0,0},
        multicast_addr: {230,1,1,251},
        # a TTL of 1 remains on the local network,
        # use this to change the number of jumps the
        # multicast packets will make
        multicast_ttl: 1]]]

    # import_config "#{Mix.env}.exs"
config :logger, level: :debug,
  backends: [
    :console
  ],
  format: "$date - $time: $metadata[$level] $message\n"
