___

# OPC UA - TELEMETRY SERVER SAMPLE 

<br/>

Elixir + OPC-UA 

## ToDo:
- [  ] Fix DataTypes
- [  ] Better organize nodes in a tree
- [  ] Read Nodes from ... Database? File?
- [  ] Create Phoenix Companion App

<br/>
<br/>



## Build and Run!

To build the container locally use:

```bash
git clone https://github.com/appoks/opcua-elixir-telemetry
cd opcua-elixir-telemetry
docker build -t opcua-demo:latest .
```

then, just run using the command:

```bash
docker run opcua-demo:latest
```

<br/>

<br/>

___

<br/>
<br/>


## Opex62541

Opex62541 is an Elixir wrapper for the [open62541](https://github.com/open62541/open62541) library; open62541 is an open-source implementation of OPC UA (OPC Unified Architecture) aka IEC 62541 licensed under Mozilla Public License v2.0.


## Features

Opex62541 implements the following features from [open62541](https://github.com/open62541/open62541):
- Communication Stack
  - OPC UA binary protocol
  - Secure communication with encrypted messages
- Server
  - Support for all OPC UA node types
  - Access control for individual nodes
  - Support for adding and removing nodes and references also at runtime.
  - Support for inheritance and instantiation of object and variable-types.
  - Support for subscriptions/monitored items.
- Client
  - All OPC UA services supported
  - Support for subscriptions/monitored items.

## Documentation

For detailed documentation and more tutorials about Opex62541 refer to it's [hexdocs.pm webpage](https://hexdocs.pm/opex62541).

