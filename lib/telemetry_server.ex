
defmodule TelemetryServer do

  alias OpcUA.{NodeId, Server, QualifiedName}

  def create_object(ns_index, pid, object) do

    IO.puts('Registrando objetos')
    IO.puts(object)

    # Object type Node
    requested_new_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 10000)
    parent_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 58)
    reference_type_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 45)
    browse_name = QualifiedName.new(ns_index: ns_index, name: "Temperature sensor")

    Server.add_object_type_node(pid,
      requested_new_node_id: requested_new_node_id,
      parent_node_id: parent_node_id,
      reference_type_node_id: reference_type_node_id,
      browse_name: browse_name
    )

    requested_new_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 10000)
    parent_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 58)
    reference_type_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 45)
    browse_name = QualifiedName.new(ns_index: ns_index, name: "Umidity sensor")

    Server.add_object_type_node(pid,
      requested_new_node_id: requested_new_node_id,
      parent_node_id: parent_node_id,
      reference_type_node_id: reference_type_node_id,
      browse_name: browse_name
    )
  end

  def create_object_node(ns_index, pid, object) do

    IO.puts('Atribuindo endereço aos objetos')
    IO.puts(object)

      # Object Node
    requested_new_node_id =
      NodeId.new(ns_index: ns_index, identifier_type: "string", identifier: "R1_TS1_VendorName")

    parent_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 85)
    reference_type_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 35)
    browse_name = QualifiedName.new(ns_index: ns_index, name: "Temperature sensor")
    type_definition = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 58)

    Server.add_object_node(pid,
      requested_new_node_id: requested_new_node_id,
      parent_node_id: parent_node_id,
      reference_type_node_id: reference_type_node_id,
      browse_name: browse_name,
      type_definition: type_definition
    )

    requested_new_node_id =
    NodeId.new(ns_index: ns_index, identifier_type: "string", identifier: "R1_US1_VendorName")

    parent_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 85)
    reference_type_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 35)
    browse_name = QualifiedName.new(ns_index: ns_index, name: "Umidity sensor")
    type_definition = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 58)

    Server.add_object_node(pid,
    requested_new_node_id: requested_new_node_id,
    parent_node_id: parent_node_id,
    reference_type_node_id: reference_type_node_id,
    browse_name: browse_name,
    type_definition: type_definition
    )
  end

  def create_node(ns_index, pid, object) do

    IO.puts('Criando variáveis')
    IO.puts(object)

    # Variable Node
    requested_new_node_id =
    NodeId.new(ns_index: ns_index, identifier_type: "string", identifier: "R1_TS1_Temperature")

    parent_node_id =
      NodeId.new(ns_index: ns_index, identifier_type: "string", identifier: "R1_TS1_VendorName")

    reference_type_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 47)
    browse_name = QualifiedName.new(ns_index: ns_index, name: "Temperature")
    type_definition = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 63)

    Server.add_variable_node(pid,
      requested_new_node_id: requested_new_node_id,
      parent_node_id: parent_node_id,
      reference_type_node_id: reference_type_node_id,
      browse_name: browse_name,
      type_definition: type_definition
    )

    :ok = Server.write_node_access_level(pid, requested_new_node_id, 3)

    requested_new_node_id =
    NodeId.new(ns_index: ns_index, identifier_type: "string", identifier: "R1_US1_Temperature")

    parent_node_id =
    NodeId.new(ns_index: ns_index, identifier_type: "string", identifier: "R1_US1_VendorName")

    reference_type_node_id = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 47)
    browse_name = QualifiedName.new(ns_index: ns_index, name: "Umidity")
    type_definition = NodeId.new(ns_index: 0, identifier_type: "integer", identifier: 63)

    Server.add_variable_node(pid,
    requested_new_node_id: requested_new_node_id,
    parent_node_id: parent_node_id,
    reference_type_node_id: reference_type_node_id,
    browse_name: browse_name,
    type_definition: type_definition
    )

    :ok = Server.write_node_access_level(pid, requested_new_node_id, 3)
  end


    def setup do

    {:ok, pid} = OpcUA.Server.start_link()
    Server.set_default_config(pid)
    Server.set_port(pid, 4050)
    {:ok, ns_index} = OpcUA.Server.add_namespace(pid, "Room")

    object = '[ [ LISTA DE OBJETOS ] ]'

    create_object(ns_index, pid, object)
    create_object_node(ns_index, pid, object)
    create_node(ns_index, pid, object)

    %{pid: pid, ns_index: ns_index}

    Server.start(pid)
  end

end
