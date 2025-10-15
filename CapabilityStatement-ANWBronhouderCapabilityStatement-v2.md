# ANW Bronhouder Capability Statement v2.0 - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ANW Bronhouder Capability Statement v2.0**

## CapabilityStatement: ANW Bronhouder Capability Statement v2.0 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANWBronhouderCapabilityStatement | *Version*:0.1.0 |
| Active as of 2025-10-15 | *Computable Name*:ANWBronhouderCapabilityStatementV2 |

 
Version 2.0 capability statement with extended requirements for ANW FHIR servers - adds support for Observation resources and write operations 

 [Raw OpenAPI-Swagger Definition file](ANWBronhouderCapabilityStatement-v2.openapi.json) | [Download](ANWBronhouderCapabilityStatement-v2.openapi.json) 

## ANW Bronhouder Capability Statement v2.0

* Implementation Guide Version: 0.1.0 
* FHIR Version: 4.0.1 
* Supported Formats: `json`, `xml`
* Published on: 2025-10-15 
* Published by: Stichting Nuts 

> **Note to Implementers: FHIR Capabilities**Any FHIR capability may be 'allowed' by the system unless explicitly marked as 'SHALL NOT'. A few items are marked as MAY in the Implementation Guide to highlight their potential relevance to the use case.

## FHIR RESTful Capabilities

### Mode: server

ANW FHIR Server v2.0 - supporting Patient and Observation resources with read, write and search operations

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
| [Patient](#Patient1-1) | [http://nuts-foundation.github.io/nl-generic-anw-ig/StructureDefinition/example-patient](StructureDefinition-example-patient.md) | y | y | y | y | identifier, family, birthdate, _lastUpdated |  |  |  |
| [Observation](#Observation1-2) | [http://hl7.org/fhir/StructureDefinition/Observation](http://hl7.org/fhir/R4/observation.html) | y | y |  | y | patient, code, date |  |  |  |

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

`create`

Create a new Patient resource

`update`

Update an existing Patient resource


Documentation
> 

Support for Patient resources conforming to the ANW Patient profile


Search Parameters


 

#### Resource Conformance: supported Observation

Base System Profile

[Observation](http://hl7.org/fhir/R4/observation.html)

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports 
`read`

Read an Observation resource by id

`search-type`

Search for Observation resources

`create`

Create a new Observation resource


Documentation
> 

Support for Observation resources - clinical observations and measurements


Search Parameters


 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ANWBronhouderCapabilityStatement-v2",
  "url" : "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANWBronhouderCapabilityStatement",
  "version" : "0.1.0",
  "name" : "ANWBronhouderCapabilityStatementV2",
  "title" : "ANW Bronhouder Capability Statement v2.0",
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
  "description" : "Version 2.0 capability statement with extended requirements for ANW FHIR servers - adds support for Observation resources and write operations",
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
      "documentation" : "ANW FHIR Server v2.0 - supporting Patient and Observation resources with read, write and search operations",
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
            },
            {
              "code" : "create",
              "documentation" : "Create a new Patient resource"
            },
            {
              "code" : "update",
              "documentation" : "Update an existing Patient resource"
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
            },
            {
              "name" : "_lastUpdated",
              "type" : "date",
              "documentation" : "Search Patient by last updated date"
            }
          ]
        },
        {
          "type" : "Observation",
          "profile" : "http://hl7.org/fhir/StructureDefinition/Observation",
          "documentation" : "Support for Observation resources - clinical observations and measurements",
          "interaction" : [
            {
              "code" : "read",
              "documentation" : "Read an Observation resource by id"
            },
            {
              "code" : "search-type",
              "documentation" : "Search for Observation resources"
            },
            {
              "code" : "create",
              "documentation" : "Create a new Observation resource"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference",
              "documentation" : "Search Observation by patient reference"
            },
            {
              "name" : "code",
              "type" : "token",
              "documentation" : "Search Observation by observation code"
            },
            {
              "name" : "date",
              "type" : "date",
              "documentation" : "Search Observation by observation date"
            }
          ]
        }
      ]
    }
  ]
}

```
