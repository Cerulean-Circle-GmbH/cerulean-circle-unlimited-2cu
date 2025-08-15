# ONCE Specification

- [Actors](#actors)
  - [System](#system)
  - [Root](#root)
  - [User](#user)
- [Use Cases](#use-cases)
  - [Once.start](#oncestart)
  - [ONCE.discover](#oncediscover)
  - [ONCE.init](#onceinit)
  - [ONCE.hibernate](#oncehibernate)
  - [ONCE.stage](#oncestage)
  - [ONCE.load](#onceload)
  - [ONCE.call](#oncecall)
  - [ONCE.stop](#oncestop)
  - [ONCE.update](#onceupdate)
- [Special Classes](#special-classes)
  - [References](#references)
  - [Streams](#streams)
  - [QoS - Quality of Service Policies](#qos-quality-of-service-policies)
  - [Server Manager](#server-manager)
- [State Diagram](#state-diagram)

# ONCE CorIM

## Actors

### System

### Root

### User

## Use Cases

**Class Once**

### Once.start

the start method exist for every thing, as well as for once. It is the static entry point to create the first instance of ONCE on the **Class** Once.  
In every Once implementation it is the first and only command being called to boot.

With root privileges In a shell it starts the ONCE [Server Manager](../345669650/ONCE_Specification.md).

With user privileges only, its starts the default ONCE Server on port 8080.

#### parameter:

once.sh call command additionalParameter  
e.g. once.sh call once.update there

#### **return:**

The start method return the Singleton ONCE as the only once instance.  

0 on successful execution or an error code with an error message on stderr

### ONCE.discover

checks the environment to discover

1. the execution environment reflected in ONCE\_MODE
  1. the current shell
  2. the last hibernated configuration from ONCE\_USERHOME/.once
    1. the current ONCE implementation
2. the current state stored in ONCE\_STATE

#### **parameter:**

none  
optional: a type:String that should be discovered

**return:**

a list of discovered [references](../345669650/ONCE_Specification.md)

0 on successful execution or an error code with an error message on stderr

### ONCE.init

initializes the ONCE Singleton instance and it’s attributes as e.g. environmental values:

ONCE\_SHELL=/bin/bash

ONCE\_DEFAULT\_SERVER=178.254.36.232

ONCE\_STATE=eamd.check

ONCE\_REPO\_PREFIX=/var/dev

ONCE\_USERHOME=/root

ONCE\_PRIVILEGE=root

#### **parameter:**

none

**return:**

0 on successful execution or an error code with an error message on stderr

### ONCE.hibernate

store all ONCE\_\* attributes in ONCE\_USERHOME/.once

#### **parameter:**

none  
optional: update

silently updates ONCE\_USERHOME/.once

**return:**

0 on successful execution or an error code with an error message on stderr

### ONCE.stage

Implements a State machine.  
tries to transition into the target state

#### **parameter:**

none: target state will be the state reflected in ONCE\_STATE

optional: targetState:String

**return:**

0 on successful execution or an error code with an error message on stderr

### ONCE.load

loads a [reference](../345669650/ONCE_Specification.md) with the corresponding loader

after loading a reference it may be started and called

#### **parameter:**

ior:String

**return:**

0 on successful execution or an error code with an error message on stderr

### ONCE.call

calls a method of an object instance represented as [reference](../345669650/ONCE_Specification.md) - no matter if local or remote, no matter which protocol: these con

#### **parameter:**

ior:String

**return:**

0 on successful execution or an error code with an error message on stderr

### ONCE.stop

the stop method exist for every thing, as well as for once. It is available as static entry point as well as a regular method on an instance of ONCE on the **Class** Once.  
It discovers the ONCE [Server Manager](../345669650/ONCE_Specification.md) and tries to stop it. Stop can only be executed with root privileges.

parameter:

e.g.  
once.sh stop

#### **return:**

The start method return the Singleton ONCE as the only once instance and shuts it down.  
ONCE\_STATE will be “stopped"

0 on successful execution or an error code with an error message on stderr

### ONCE.update

## Special Classes

### References

ior / IOR are "Internet Object References" in the sense of OMG CORBA IORs, that reference local or remote objects as fully specified URLs.

### Streams

### QoS - Quality of Service Policies

### Server Manager

## State Diagram