# Artifacts Summary - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Capability Statements 

The following artifacts define the specific capabilities that different types of systems are expected to have in order to comply with this implementation guide. Systems conforming to this implementation guide are expected to declare conformance to one or more of the following capability statements.

| | |
| :--- | :--- |
| [ANW Bronhouder Capability Statement v1.0.0](CapabilityStatement-ANWBronhouderCapabilityStatement-v1.md) | Capability statement describing the basic requirements for ANW FHIR servers (version 1.0.0, ANW-bronhouder) |
| [ANW Regisseur Capability Statement v1.0.0](CapabilityStatement-ANWRegisseurCapabilityStatement-v1.md) | Capability statement describing the basic requirements for ANW FHIR servers (version 1.0.0, ANW-Regisseur) |
| [ANW Zorgverlener Capability Statement v1.0.0](CapabilityStatement-ANWZorgverlenerCapabilityStatement-v1.md) | Capability statement describing the basic requirements for ANW FHIR servers (version 1.0.0, ANW-Zorgverlener) |

### Behavior: Operation Definitions 

These are custom operations that can be supported by and/or invoked by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [ANW-zorg](OperationDefinition-ANW-zorg.md) | Custom named query on Practitioner or Patient, invoked with _query=ANW-zorg |

