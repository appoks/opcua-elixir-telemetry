defmodule Opex62541 do
  @moduledoc """
  Documentation for Opex62541.
  """


  use Application
  require DiscoveryServer
  require TelemetryServer

  def start(_type, _args) do
    IO.puts " =========================== "
    IO.puts ""
    IO.puts " > Starting Telemetry Server "
    IO.puts ""
    IO.puts " --------------------------- "
    IO.puts ""
    IO.puts " OPC-UA SAMPLE -- GEN SERVER "
    IO.puts ""
    IO.puts " --------------------------- "
    IO.puts ""

    DiscoveryServer.setup()
    TelemetryServer.setup()

    run()
    # some more stuff
  end

  def run do
    run()
  end

end
