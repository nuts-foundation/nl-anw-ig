# ANW-zorg - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ANW-zorg**

## OperationDefinition: ANW-zorg 

| | |
| :--- | :--- |
| *Official URL*:http://nuts-foundation.github.io/nl-generic-anw-ig/OperationDefinition/ANW-zorg | *Version*:0.1.0 |
| Active as of 2025-10-23 | *Computable Name*:ANW-zorg |

 
Custom named query on Practitioner or Patient, invoked with _query=ANW-zorg 

URL: [base]/Practitioner?_query=ANW-zorg&...

URL: [base]/Patient?_query=ANW-zorg&...

### Parameters




## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "ANW-zorg",
  "url" : "http://nuts-foundation.github.io/nl-generic-anw-ig/OperationDefinition/ANW-zorg",
  "version" : "0.1.0",
  "name" : "ANW-zorg",
  "status" : "active",
  "kind" : "query",
  "date" : "2025-10-23T08:57:57+00:00",
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
  "description" : "Custom named query on Practitioner or Patient, invoked with _query=ANW-zorg",
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
  "code" : "ANW-zorg",
  "resource" : ["Practitioner", "Patient"],
  "system" : false,
  "type" : true,
  "instance" : false
}

```
