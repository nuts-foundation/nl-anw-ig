# ANW Bronhouder Capability Statement v1.0 - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ANW Bronhouder Capability Statement v1.0**

## CapabilityStatement: ANW Bronhouder Capability Statement v1.0 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Bronhouder | *Version*:0.1.0 |
| Active as of 2025-10-15 | *Computable Name*:ANW-Bronhouder |

 
Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Bronhouder usecase. 

 [Raw OpenAPI-Swagger Definition file](ANWBronhouderCapabilityStatement-v1.openapi.json) | [Download](ANWBronhouderCapabilityStatement-v1.openapi.json) 

## ANW Bronhouder Capability Statement v1.0

* Implementation Guide Version: 0.1.0 
* FHIR Version: 4.0.1 
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
| [Patient](#Patient1-1) |   | y | y |  |  | _id | `PractitionerRole:organization` |  |  |
| [Observation](#Observation1-2) | http://nictiz.nl/fhir/StructureDefinition/zib-BloodPressure |  | y |  | y | patient, _profile, _sort, _count |  |  |  |
| [Observation](#Observation1-3) | http://nictiz.nl/fhir/StructureDefinition/zib-BodyTemperature |  | y |  | y | patient, _profile, _sort, _count |  |  |  |
| [Observation](#Observation1-4) | http://nictiz.nl/fhir/StructureDefinition/zib-BodyHeight |  | y |  | y | patient, _profile, _sort, _count |  |  |  |
| [Observation](#Observation1-5) | http://nictiz.nl/fhir/StructureDefinition/zib-BodyWeight |  | y |  |  | patient, _profile, _sort, _count |  |  |  |
| [Observation](#Observation1-6) | http://nictiz.nl/fhir/StructureDefinition/zib-Respiration |  | y |  |  | patient, _profile, _sort, _count |  |  |  |
| [Observation](#Observation1-7) | https://nuts.nl/fhir/StructureDefinition/nl-core-nursingreport |  | y |  | y | patient, _profile, _sort, _count |  |  |  |
| [Observation](#Observation1-8) | http://nictiz.nl/fhir/StructureDefinition/zib-LivingSituation |  | y |  |  | patient, _profile, _sort, _count |  |  |  |
| [Flag](#Flag1-9) | http://nictiz.nl/fhir/StructureDefinition/zib-Alert |  | y |  |  | patient, _profile |  |  |  |
| [Consent](#Consent1-10) | http://nictiz.nl/fhir/StructureDefinition/zib-AdvanceDirective |  | y |  |  | patient, _profile |  |  |  |
| [AllergyIntolerance](#AllergyIntolerance1-11) | http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance |  | y |  |  | patient, _profile |  |  |  |

-------

#### Resource Conformance: supported Patient

Core FHIR Resource

[Patient](http://hl7.org/fhir/R4/patient.html)

Reference Policy

Interaction summary

* Supports `read`, `search-type`.

Search Parameters


 

#### Resource Conformance: supported Observation

Base System Profile

`http://nictiz.nl/fhir/StructureDefinition/zib-BloodPressure`

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports `search-type`, `create`.

Search Parameters


 

#### Resource Conformance: supported Observation

Base System Profile

`http://nictiz.nl/fhir/StructureDefinition/zib-BodyTemperature`

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports `search-type`, `create`.

Search Parameters


 

#### Resource Conformance: supported Observation

Base System Profile

`http://nictiz.nl/fhir/StructureDefinition/zib-BodyHeight`

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports `search-type`, `create`.

Search Parameters


 

#### Resource Conformance: supported Observation

Base System Profile

`http://nictiz.nl/fhir/StructureDefinition/zib-BodyWeight`

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports `search-type`.

Search Parameters


 

#### Resource Conformance: supported Observation

Base System Profile

`http://nictiz.nl/fhir/StructureDefinition/zib-Respiration`

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports `search-type`.

Search Parameters


 

#### Resource Conformance: supported Observation

Base System Profile

`https://nuts.nl/fhir/StructureDefinition/nl-core-nursingreport`

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports `search-type`, `create`.

Search Parameters


 

#### Resource Conformance: supported Observation

Base System Profile

`http://nictiz.nl/fhir/StructureDefinition/zib-LivingSituation`

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports `search-type`.

Search Parameters


 

#### Resource Conformance: supported Flag

Base System Profile

`http://nictiz.nl/fhir/StructureDefinition/zib-Alert`

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports `search-type`.

Search Parameters


 

#### Resource Conformance: supported Consent

Base System Profile

`http://nictiz.nl/fhir/StructureDefinition/zib-AdvanceDirective`

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports `search-type`.

Search Parameters


 

#### Resource Conformance: supported AllergyIntolerance

Base System Profile

`http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance`

Profile Conformance

**SHALL**

Reference Policy

Interaction summary

* Supports `search-type`.

Search Parameters


 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ANWBronhouderCapabilityStatement-v1",
  "url" : "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Bronhouder",
  "version" : "0.1.0",
  "name" : "ANW-Bronhouder",
  "title" : "ANW Bronhouder Capability Statement v1.0",
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
  "description" : "Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Bronhouder usecase.",
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
      "documentation" : "ANW FHIR Server v1.0 - supporting Patient resources with ANW-specific profiles",
      "resource" : [
        {
          "type" : "Patient",
          "interaction" : [
            {
              "code" : "read"
            },
            {
              "code" : "search-type"
            }
          ],
          "searchInclude" : ["PractitionerRole:organization"],
          "searchParam" : [
            {
              "name" : "_id",
              "type" : "token"
            }
          ]
        },
        {
          "type" : "Observation",
          "profile" : "http://nictiz.nl/fhir/StructureDefinition/zib-BloodPressure",
          "interaction" : [
            {
              "code" : "search-type"
            },
            {
              "code" : "create"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference"
            },
            {
              "name" : "_profile",
              "type" : "string"
            },
            {
              "name" : "_sort",
              "type" : "string"
            },
            {
              "name" : "_count",
              "type" : "number"
            }
          ]
        },
        {
          "type" : "Observation",
          "profile" : "http://nictiz.nl/fhir/StructureDefinition/zib-BodyTemperature",
          "interaction" : [
            {
              "code" : "search-type"
            },
            {
              "code" : "create"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference"
            },
            {
              "name" : "_profile",
              "type" : "string"
            },
            {
              "name" : "_sort",
              "type" : "string"
            },
            {
              "name" : "_count",
              "type" : "number"
            }
          ]
        },
        {
          "type" : "Observation",
          "profile" : "http://nictiz.nl/fhir/StructureDefinition/zib-BodyHeight",
          "interaction" : [
            {
              "code" : "search-type"
            },
            {
              "code" : "create"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference"
            },
            {
              "name" : "_profile",
              "type" : "string"
            },
            {
              "name" : "_sort",
              "type" : "string"
            },
            {
              "name" : "_count",
              "type" : "number"
            }
          ]
        },
        {
          "type" : "Observation",
          "profile" : "http://nictiz.nl/fhir/StructureDefinition/zib-BodyWeight",
          "interaction" : [
            {
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference"
            },
            {
              "name" : "_profile",
              "type" : "string"
            },
            {
              "name" : "_sort",
              "type" : "string"
            },
            {
              "name" : "_count",
              "type" : "number"
            }
          ]
        },
        {
          "type" : "Observation",
          "profile" : "http://nictiz.nl/fhir/StructureDefinition/zib-Respiration",
          "interaction" : [
            {
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference"
            },
            {
              "name" : "_profile",
              "type" : "string"
            },
            {
              "name" : "_sort",
              "type" : "string"
            },
            {
              "name" : "_count",
              "type" : "number"
            }
          ]
        },
        {
          "type" : "Observation",
          "profile" : "https://nuts.nl/fhir/StructureDefinition/nl-core-nursingreport",
          "interaction" : [
            {
              "code" : "search-type"
            },
            {
              "code" : "create"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference"
            },
            {
              "name" : "_profile",
              "type" : "string"
            },
            {
              "name" : "_sort",
              "type" : "string"
            },
            {
              "name" : "_count",
              "type" : "number"
            }
          ]
        },
        {
          "type" : "Observation",
          "profile" : "http://nictiz.nl/fhir/StructureDefinition/zib-LivingSituation",
          "interaction" : [
            {
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference"
            },
            {
              "name" : "_profile",
              "type" : "string"
            },
            {
              "name" : "_sort",
              "type" : "string"
            },
            {
              "name" : "_count",
              "type" : "number"
            }
          ]
        },
        {
          "type" : "Flag",
          "profile" : "http://nictiz.nl/fhir/StructureDefinition/zib-Alert",
          "interaction" : [
            {
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference"
            },
            {
              "name" : "_profile",
              "type" : "string"
            }
          ]
        },
        {
          "type" : "Consent",
          "profile" : "http://nictiz.nl/fhir/StructureDefinition/zib-AdvanceDirective",
          "interaction" : [
            {
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference"
            },
            {
              "name" : "_profile",
              "type" : "string"
            }
          ]
        },
        {
          "type" : "AllergyIntolerance",
          "profile" : "http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance",
          "interaction" : [
            {
              "code" : "search-type"
            }
          ],
          "searchParam" : [
            {
              "name" : "patient",
              "type" : "reference"
            },
            {
              "name" : "_profile",
              "type" : "string"
            }
          ]
        }
      ],
      "operation" : [
        {
          "name" : "bronhouder-notification-endpoint",
          "definition" : "https://github.com/nuts-foundation/bolts/blob/master/anw/TD-ANWv2024.1.md#anw-bronhouder"
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
