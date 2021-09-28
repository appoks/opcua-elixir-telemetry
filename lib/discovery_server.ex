defmodule DiscoveryServer do

  def setup do

  alias OpcUA.{Server}


  {:ok, lds_pid} = Server.start_link()

  :ok = Server.set_default_config(lds_pid)
  :ok = Server.set_port(lds_pid, 4040)

  :ok = Server.start(lds_pid)

  end

end
