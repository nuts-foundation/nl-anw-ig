# ANW Regisseur Capability Statement v1.0.0 - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ANW Regisseur Capability Statement v1.0.0**

## CapabilityStatement: ANW Regisseur Capability Statement v1.0.0 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Regisseur | *Version*:0.1.0 |
| Active as of 2025-10-15 | *Computable Name*:ANW-Regisseur |

 
Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Regisseur usecase. 

 [Raw OpenAPI-Swagger Definition file](ANWRegisseurCapabilityStatement-v1.openapi.json) | [Download](ANWRegisseurCapabilityStatement-v1.openapi.json) 

## ANW Regisseur Capability Statement v1.0.0

* Implementation Guide Version: 0.1.0 
* FHIR Version: 3.0.2 
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
| [Task](#Task1-1) |   | y |  | y |  |  |  |  |  |

-------

#### Resource Conformance: supported Task

Core FHIR Resource

[Task](http://hl7.org/fhir/R3/task.html)

Reference Policy

Interaction summary

* Supports 
`read`

Retrieval of fhir task from reggiseur

`update`

Update of fhir task of reggiseur




## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ANWRegisseurCapabilityStatement-v1",
  "url" : "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Regisseur",
  "version" : "0.1.0",
  "name" : "ANW-Regisseur",
  "title" : "ANW Regisseur Capability Statement v1.0.0",
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
  "description" : "Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Regisseur usecase.",
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
  "fhirVersion" : "3.0.2",
  "format" : ["json", "xml"],
  "rest" : [
    {
      "mode" : "server",
      "documentation" : "ANW FHIR Server v1.0 - supporting Patient resources with ANW-specific profiles",
      "resource" : [
        {
          "type" : "Task",
          "interaction" : [
            {
              "code" : "read",
              "documentation" : "Retrieval of fhir task from reggiseur"
            },
            {
              "code" : "update",
              "documentation" : "Update of fhir task of reggiseur"
            }
          ]
        }
      ]
    }
  ]
}

```
