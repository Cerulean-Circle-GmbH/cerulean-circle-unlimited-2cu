[📁 Neom Poc GitHub](/cerulean-circle-unlimited-2cu/product/development/2cu-custom-development/neom-poc.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/2cu-custom-development/neom-poc/non-functional-requirements.md) | [🌐 Index Structure local SymLink](./non-functional-requirements.entry.md)

# Non Functional Requirements

- [LFF](#lff)
- [TRACE-ID](#trace-id)
- [DEBUG](#debug)
- [Monitoring](#monitoring)
- [Configuration](#configuration)
- [Communication / Crypto](#communication-crypto)
- [Exception Handling](#exception-handling)
- [State Management](#state-management)
- [Licenses](#licenses)
- [Installation](#installation)
- [Integration w/ other Applications](#integration-w-other-applications)

# LFF

> [!INFO]
> The logfiles should follow a standard so it can be traceable though the different Microservices.

# TRACE-ID

> [!INFO]
> Requests coming in to the NEOM App should be traceable, so any request initiated by an event should get a traceable id, containing information about all components it passes in lifetime, that helps to debug.

# DEBUG

> [!INFO]
> debug level shall be changed on runtime without restart

# Monitoring

> [!INFO]
> know about the number of instances running around

> [!INFO]
> software shall be monitored on an external application #users, #servers, #instances

# Configuration

> [!INFO]
> Configuration shall be changed in runtime for new instances being called

# Communication / Crypto

> [!INFO]
> All communication over µs borders shall be encrypted

# Exception Handling

> [!INFO]
> All Exceptions shall be caught and stored in files, the framework shall not be impacted

# State Management

> [!INFO]
> The application shall be state free

# Licenses

> [!INFO]
> Software needs to be compliant to used software

# Installation

Applications shall be installed by drag and drop

# Integration w/ other Applications

Interfaces need to be fully defined and ideally stateless
