# ANW Bronhouder Capability Statement v1.0.0 - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ANW Bronhouder Capability Statement v1.0.0**

## CapabilityStatement: ANW Bronhouder Capability Statement v1.0.0 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Bronhouder | *Version*:1.0.0 |
| Active as of 2025-10-15 | *Computable Name*:ANW-Bronhouder |

 
Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Bronhouder usecase. 

 [Raw OpenAPI-Swagger Definition file](ANWBronhouderCapabilityStatement-v1.0.0.openapi.json) | [Download](ANWBronhouderCapabilityStatement-v1.0.0.openapi.json) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ANWBronhouderCapabilityStatement-v1.0.0",
  "url" : "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Bronhouder",
  "version" : "1.0.0",
  "name" : "ANW-Bronhouder",
  "title" : "ANW Bronhouder Capability Statement v1.0.0",
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
  "fhirVersion" : "3.0.2",
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
          "profile" : "http://nictiz.nl/fhir/StructureDefinition/zib-PulseRate",
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
