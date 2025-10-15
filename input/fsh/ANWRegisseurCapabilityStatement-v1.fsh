Instance: ANWRegisseurCapabilityStatement-v1
InstanceOf: CapabilityStatement
Usage: #definition
Title: "ANW Regisseur Capability Statement v1.0"
Description: "Capability statement describing the basic requirements for ANW FHIR servers (version 1.0)"
* url = "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANWRegisseurCapabilityStatement"
* version = "1.0.0"
* name = "ANWRegisseurCapabilityStatementV1"
* status = #active
* date = "2025-10-15"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* publisher = "Stichting Nuts"
* contact[0].name = "Stichting Nuts"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value = "https://www.nuts.nl"
* description = "Version 1.0 capability statement defining the basic requirements for ANW FHIR servers - supports Patient resources with read and search operations"

// Server capabilities
* rest.mode = #server
* rest.documentation = "ANW FHIR Server v1.0 - supporting Patient resources with ANW-specific profiles"

// Patient resource support
* rest.resource[0].type = #Patient
* rest.resource[0].profile = "http://nuts-foundation.github.io/nl-generic-anw-ig/StructureDefinition/example-patient"
* rest.resource[0].documentation = "Support for Patient resources conforming to the ANW Patient profile"
* rest.resource[0].interaction[0].code = #read
* rest.resource[0].interaction[0].documentation = "Read a Patient resource by id"
* rest.resource[0].interaction[1].code = #search-type
* rest.resource[0].interaction[1].documentation = "Search for Patient resources"
* rest.resource[0].searchParam[0].name = "identifier"
* rest.resource[0].searchParam[0].type = #token
* rest.resource[0].searchParam[0].documentation = "Search Patient by identifier (e.g., BSN)"
* rest.resource[0].searchParam[1].name = "family"
* rest.resource[0].searchParam[1].type = #string
* rest.resource[0].searchParam[1].documentation = "Search Patient by family name"
* rest.resource[0].searchParam[2].name = "birthdate"
* rest.resource[0].searchParam[2].type = #date
* rest.resource[0].searchParam[2].documentation = "Search Patient by birth date"
