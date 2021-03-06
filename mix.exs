defmodule Libclusterplay.Mixfile do
  use Mix.Project

  def project do
    [app: :libclusterplay,
     version: "0.1.0",
     elixir: "~> 1.9",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      mod: {Libclusterplay, []},
      applications: [
        # :libclusterplay,
        :logger,
        :libcluster,
        :gproc
      ]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:libcluster, "3.0.3"},
      {:gproc, "0.6.1"}
    ]
  end
end
