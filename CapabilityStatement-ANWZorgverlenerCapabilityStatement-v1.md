# ANW Zorgverlener Capability Statement v1.0.0 - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ANW Zorgverlener Capability Statement v1.0.0**

## CapabilityStatement: ANW Zorgverlener Capability Statement v1.0.0 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Zorgverlener | *Version*:0.1.0 |
| Active as of 2025-10-15 | *Computable Name*:ANW-Zorgverlener |

 
Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Zorgverlener usecase. 

 [Raw OpenAPI-Swagger Definition file](ANWZorgverlenerCapabilityStatement-v1.openapi.json) | [Download](ANWZorgverlenerCapabilityStatement-v1.openapi.json) 

## ANW Zorgverlener Capability Statement v1.0.0

* Implementation Guide Version: 0.1.0 
* FHIR Version: 3.0.2 
* Supported Formats: `json`, `xml`
* Published on: 2025-10-15 
* Published by: Stichting Nuts 

> **Note to Implementers: FHIR Capabilities**Any FHIR capability may be 'allowed' by the system unless explicitly marked as 'SHALL NOT'. A few items are marked as MAY in the Implementation Guide to highlight their potential relevance to the use case.

## FHIR RESTful Capabilities

### Mode: server

ANW FHIR Server v1.0 - supporting Patient resources with ANW-specific profiles

Summary of System-wide Operations


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
| [Practitioner](#Practitioner1-1) |   |  | y |  |  |  |  |  |  |

-------

#### Resource Conformance: supported Practitioner

Core FHIR Resource

[Practitioner](http://hl7.org/fhir/R3/practitioner.html)

Reference Policy

Interaction summary

* Supports `search-type`.



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ANWZorgverlenerCapabilityStatement-v1",
  "url" : "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Zorgverlener",
  "version" : "0.1.0",
  "name" : "ANW-Zorgverlener",
  "title" : "ANW Zorgverlener Capability Statement v1.0.0",
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
  "description" : "Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Zorgverlener usecase.",
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
          "type" : "Practitioner",
          "interaction" : [
            {
              "code" : "search-type"
            }
          ]
        }
      ],
      "operation" : [
        {
          "name" : "zorgverlener-notification-endpoint",
          "definition" : "https://github.com/nuts-foundation/bolts/blob/master/anw/TD-ANWv2024.1.md#anw-zorgverlener"
        },
        {
          "name" : "ANW-zorg",
          "definition" : "http://nuts-foundation.github.io/nl-generic-anw-ig/OperationDefinition/ANW-zorg"
        }
      ]
    }
  ]
}

```
