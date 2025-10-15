# Voorbeeld patient - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Voorbeeld patient**

## Resource Profile: Voorbeeld patient 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/StructureDefinition/example-patient | *Version*:0.1.0 |
| Draft as of 2025-10-15 | *Computable Name*:NLPatient |

 
Patient profiel met verplicht BSN nummer. 

**Usages:**

* CapabilityStatements using this Profile: [ANW Server Capability Statement v1.0](CapabilityStatement-ANWServerCapabilityStatement-v1.md) and [ANW Server Capability Statement v2.0](CapabilityStatement-ANWServerCapabilityStatement-v2.md)
* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/nl.nuts.anw|current/StructureDefinition/example-patient)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-example-patient.csv), [Excel](StructureDefinition-example-patient.xlsx), [Schematron](StructureDefinition-example-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "example-patient",
  "url" : "http://nuts-foundation.github.io/nl-generic-anw-ig/StructureDefinition/example-patient",
  "version" : "0.1.0",
  "name" : "NLPatient",
  "title" : "Voorbeeld patient",
  "status" : "draft",
  "date" : "2025-10-15T12:01:34+00:00",
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
  "description" : "Patient profiel met verplicht BSN nummer.",
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
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "loinc",
      "uri" : "http://loinc.org",
      "name" : "LOINC code for the element"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Patient",
        "path" : "Patient"
      },
      {
        "id" : "Patient.identifier",
        "path" : "Patient.identifier",
        "min" : 1
      },
      {
        "id" : "Patient.identifier.system",
        "path" : "Patient.identifier.system",
        "fixedUri" : "http://fhir.nl/fhir/NamingSystem/bsn"
      },
      {
        "id" : "Patient.identifier.value",
        "path" : "Patient.identifier.value",
        "min" : 1
      },
      {
        "id" : "Patient.name",
        "path" : "Patient.name",
        "min" : 1
      },
      {
        "id" : "Patient.gender",
        "path" : "Patient.gender",
        "min" : 1
      },
      {
        "id" : "Patient.birthDate",
        "path" : "Patient.birthDate",
        "min" : 1
      }
    ]
  }
}

```
