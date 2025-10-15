# ANW Server Capability Statement - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ANW Server Capability Statement**

## CapabilityStatement: ANW Server Capability Statement 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANWServerCapabilityStatement | *Version*:0.1.0 |
| Active as of 2025-10-15 | *Computable Name*:ANWServerCapabilityStatement |

 
This capability statement defines the expected capabilities of FHIR servers supporting the ANW use case 

 [Raw OpenAPI-Swagger Definition file](ANWServerCapabilityStatement.openapi.json) | [Download](ANWServerCapabilityStatement.openapi.json) 

## ANW Server Capability Statement

* Implementation Guide Version: 0.1.0 
* FHIR Version: 4.0.1 
* Supported Formats: `json`, `xml`
* Published on: 2025-10-15 
* Published by: Stichting Nuts 

> **Note to Implementers: FHIR Capabilities**Any FHIR capability may be 'allowed' by the system unless explicitly marked as 'SHALL NOT'. A few items are marked as MAY in the Implementation Guide to highlight their potential relevance to the use case.

## FHIR RESTful Capabilities

### Mode: server

ANW FHIR Server supporting Patient resources with ANW-specific profiles

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


 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ANWServerCapabilityStatement",
  "url" : "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANWServerCapabilityStatement",
  "version" : "0.1.0",
  "name" : "ANWServerCapabilityStatement",
  "title" : "ANW Server Capability Statement",
  "status" : "active",
  "date" : "2025-10-15",
  "publisher" : "Stichting Nuts",
  "contact" : [
    {
      "name" : "Stichting Nuts",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.nuts.nl"
        }
      ]
    }
  ],
  "description" : "This capability statement defines the expected capabilities of FHIR servers supporting the ANW use case",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "NL",
          "display" : "Netherlands"
        }
      ]
    }
  ],
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["json", "xml"],
  "rest" : [
    {
      "mode" : "server",
      "documentation" : "ANW FHIR Server supporting Patient resources with ANW-specific profiles",
      "resource" : [
        {
          "type" : "Patient",
          "profile" : "http://nuts-foundation.github.io/nl-generic-anw-ig/StructureDefinition/example-patient",
          "documentation" : "Support for Patient resources conforming to the ANW Patient profile",
          "interaction" : [
            {
              "code" : "read",
              "documentation" : "Read a Patient resource by id"
            },
            {
              "code" : "search-type",
              "documentation" : "Search for Patient resources"
            }
          ],
          "searchParam" : [
            {
              "name" : "identifier",
              "type" : "token",
              "documentation" : "Search Patient by identifier (e.g., BSN)"
            },
            {
              "name" : "family",
              "type" : "string",
              "documentation" : "Search Patient by family name"
            },
            {
              "name" : "birthdate",
              "type" : "date",
              "documentation" : "Search Patient by birth date"
            }
          ]
        }
      ]
    }
  ]
}

```
