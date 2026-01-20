# ANW Regisseur Capability Statement v1.0.0 - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ANW Regisseur Capability Statement v1.0.0**

## CapabilityStatement: ANW Regisseur Capability Statement v1.0.0 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Regisseur | *Version*:1.0.0 |
| Active as of 2025-10-15 | *Computable Name*:ANW-Regisseur |

 
Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Regisseur usecase. 

 [Raw OpenAPI-Swagger Definition file](ANWRegisseurCapabilityStatement-v1.0.0.openapi.json) | [Download](ANWRegisseurCapabilityStatement-v1.0.0.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ANWRegisseurCapabilityStatement-v1.0.0",
  "url" : "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Regisseur",
  "version" : "1.0.0",
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
