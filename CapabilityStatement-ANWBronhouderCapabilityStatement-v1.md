# ANW Server Capability Statement v1.0 - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ANW Server Capability Statement v1.0**

## CapabilityStatement: ANW Server Capability Statement v1.0 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANWBronhouderCapabilityStatement | *Version*:0.1.0 |
| Active as of 2025-10-15 | *Computable Name*:ANWBronhouderCapabilityStatementV1 |

 
Version 1.0 capability statement defining the basic requirements for ANW FHIR servers - supports Patient resources with read and search operations 

 [Raw OpenAPI-Swagger Definition file](ANWBronhouderCapabilityStatement-v1.openapi.json) | [Download](ANWBronhouderCapabilityStatement-v1.openapi.json) 

## ANW Server Capability Statement v1.0

* Implementation Guide Version: 0.1.0 
* FHIR Version: 4.0.1 
* Supported Formats: `json`, `xml`
* Published on: 2025-10-15 
* Published by: Stichting Nuts 

> **Note to Implementers: FHIR Capabilities**Any FHIR capability may be 'allowed' by the system unless explicitly marked as 'SHALL NOT'. A few items are marked as MAY in the Implementation Guide to highlight their potential relevance to the use case.

## FHIR RESTful Capabilities

### Mode: server

ANW FHIR Server v1.0 - supporting Patient resources with ANW-specific profiles

### Capabilities by Resource/Profile

#### Summary

The summary table lists the resources that are part of this configuration, and for each resource it lists:

* The relevant profiles (if any)
* The interactions supported by each resource (**R**ead, **S**earch, **U**pdate, and **C**reate, are always shown, while **VR**ead, **P**atch, **D**elete, **H**istory on **I**nstance, or **H**istory on **T**ype are only present if at least one of the resources has support for them.
* The required, recommended, and some optional search parameters (if any).
* The linked resources enabled for `_include`
* The other resources enabled for `_revinclude`
* The operations on the resource (if any)

| | | | | | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| [Patient](#Patient1-1) | [http://nuts-foundation.github.io/nl-generic-anw-ig/StructureDefinition/example-patient](StructureDefinition-example-patient.md) | y | y |  |  | identifier, family, birthdate |  |  |  |

-------

#### Resource Conformance: supported Patient

Base System Profile

[Voorbeeld patient](StructureDefinition-example-patient.md)

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports 
`read`

Read a Patient resource by id

`search-type`

Search for Patient resources


Documentation
> 

Support for Patient resources conforming to the ANW Patient profile


Search Parameters


 

