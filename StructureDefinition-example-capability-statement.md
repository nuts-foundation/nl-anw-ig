# Voorbeeld capability statement - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Voorbeeld capability statement**

## Resource Profile: Voorbeeld capability statement 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/StructureDefinition/example-capability-statement | *Version*:0.1.0 |
| Draft as of 2025-10-15 | *Computable Name*:ANWCapabilityStatement |

 
CapabilityStatement profiel test. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/nl.nuts.anw|current/StructureDefinition/example-capability-statement)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-example-capability-statement.csv), [Excel](StructureDefinition-example-capability-statement.xlsx), [Schematron](StructureDefinition-example-capability-statement.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "example-capability-statement",
  "url" : "http://nuts-foundation.github.io/nl-generic-anw-ig/StructureDefinition/example-capability-statement",
  "version" : "0.1.0",
  "name" : "ANWCapabilityStatement",
  "title" : "Voorbeeld capability statement",
  "status" : "draft",
  "date" : "2025-10-15T10:55:58+00:00",
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
  "description" : "CapabilityStatement profiel test.",
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
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "objimpl",
      "uri" : "http://hl7.org/fhir/object-implementation",
      "name" : "Object Implementation Information"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "CapabilityStatement",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/CapabilityStatement",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "CapabilityStatement",
        "path" : "CapabilityStatement"
      }
    ]
  }
}

```
