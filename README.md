___

# OPC UA - TELEMETRY SERVER SAMPLE 

<br/>

Elixir + OPC-UA 

<br/>

___

<br/>

## ToDo:

<br/>

- [  ] Fix dataTypes
- [  ] Better organize nodes in a tree
- [  ] Read nodes from ... Database? File?
- [  ] Include unit tests
- [  ] Create Phoenix companion app
- [  ] Improve this documentation

<br/>
<br/>



## Build and Run!
<br/>

To build the container locally use:

```bash
git clone https://github.com/appoks/opcua-elixir-telemetry
cd opcua-elixir-telemetry
docker build -t opcua-demo:latest .
```

then, just run the container using the command:

```bash
docker run -d -p 4050:4050 4040:4040 opcua-demo:latest
```
<br/>

You can now use an OPC-UA Client/Explorer to connect to the server running at the URL `opc.tcp://localhost:4050`. Chech that there are two objects alongside the server, one for a temperature sensor and another one with umidity sensor. 

The server has been tested with *Integration Objects*' OPC-UA Client. *Matrikon*'s OPC-UA client is not supported for now. Feel free to suggest a client that I should test with. 

<br/>

<br/>

> <b>Note:</b> The tests provided within the repository are only for the Opex library. I didn't create any test for my implementation yet. 

___

<br/>
<br/>


## Opex62541

Opex62541 is an Elixir wrapper for the [open62541](https://github.com/open62541/open62541) library; open62541 is an open-source implementation of OPC UA (OPC Unified Architecture) aka IEC 62541 licensed under Mozilla Public License v2.0.

<br/>

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

