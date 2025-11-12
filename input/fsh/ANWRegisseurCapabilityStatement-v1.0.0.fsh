Instance: ANWRegisseurCapabilityStatement-v1
InstanceOf: CapabilityStatement
Usage: #definition
Title: "ANW Regisseur Capability Statement v1.0.0"
Description: "Capability statement describing the basic requirements for ANW FHIR servers  (version 1.0.0, ANW-Regisseur)"
* url = "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Regisseur"
* version = "1.0.0"
* name = "ANW-Regisseur"
* status = #active
* date = "2025-10-15"
* kind = #requirements
* fhirVersion = #3.0.2
* format[0] = #json
* format[1] = #xml
* publisher = "Stichting Nuts"
* contact[0].name = "Stichting Nuts"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "https://www.nuts.nl"
* description = "Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Regisseur usecase."

// Server capabilities
* rest.mode = #server
* rest.documentation = "ANW FHIR Server v1.0 - supporting Patient resources with ANW-specific profiles"

* rest[0].resource[0].type = #Task

* rest[0].resource[0].interaction[0].code = #read
* rest[0].resource[0].interaction[0].documentation = "Retrieval of fhir task from reggiseur"

* rest[0].resource[0].interaction[1].code = #update
* rest[0].resource[0].interaction[1].documentation = "Update of fhir task of reggiseur"
