// ============================================================================
// ANW Server CapabilityStatement - Versie 1.0 (Basis functionaliteit)
// ============================================================================
Instance: ANWServerCapabilityStatement-v1
InstanceOf: CapabilityStatement
Usage: #definition
Title: "ANW Server Capability Statement v1.0"
Description: "Capability statement describing the basic requirements for ANW FHIR servers (version 1.0)"
* url = "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANWServerCapabilityStatement"
* version = "1.0.0"
* name = "ANWServerCapabilityStatementV1"
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


// ============================================================================
// ANW Server CapabilityStatement - Versie 2.0 (Uitgebreide functionaliteit)
// ============================================================================
Instance: ANWServerCapabilityStatement-v2
InstanceOf: CapabilityStatement
Usage: #definition
Title: "ANW Server Capability Statement v2.0"
Description: "Capability statement describing the extended requirements for ANW FHIR servers (version 2.0)"
* url = "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANWServerCapabilityStatement"
* version = "2.0.0"
* name = "ANWServerCapabilityStatementV2"
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
* description = "Version 2.0 capability statement with extended requirements for ANW FHIR servers - adds support for Observation resources and write operations"

// Server capabilities
* rest.mode = #server
* rest.documentation = "ANW FHIR Server v2.0 - supporting Patient and Observation resources with read, write and search operations"

// Patient resource support (uitgebreid met write operaties)
* rest.resource[0].type = #Patient
* rest.resource[0].profile = "http://nuts-foundation.github.io/nl-generic-anw-ig/StructureDefinition/example-patient"
* rest.resource[0].documentation = "Support for Patient resources conforming to the ANW Patient profile"
* rest.resource[0].interaction[0].code = #read
* rest.resource[0].interaction[0].documentation = "Read a Patient resource by id"
* rest.resource[0].interaction[1].code = #search-type
* rest.resource[0].interaction[1].documentation = "Search for Patient resources"
* rest.resource[0].interaction[2].code = #create
* rest.resource[0].interaction[2].documentation = "Create a new Patient resource"
* rest.resource[0].interaction[3].code = #update
* rest.resource[0].interaction[3].documentation = "Update an existing Patient resource"
* rest.resource[0].searchParam[0].name = "identifier"
* rest.resource[0].searchParam[0].type = #token
* rest.resource[0].searchParam[0].documentation = "Search Patient by identifier (e.g., BSN)"
* rest.resource[0].searchParam[1].name = "family"
* rest.resource[0].searchParam[1].type = #string
* rest.resource[0].searchParam[1].documentation = "Search Patient by family name"
* rest.resource[0].searchParam[2].name = "birthdate"
* rest.resource[0].searchParam[2].type = #date
* rest.resource[0].searchParam[2].documentation = "Search Patient by birth date"
* rest.resource[0].searchParam[3].name = "_lastUpdated"
* rest.resource[0].searchParam[3].type = #date
* rest.resource[0].searchParam[3].documentation = "Search Patient by last updated date"

// Observation resource support (NIEUW in v2.0)
* rest.resource[1].type = #Observation
* rest.resource[1].profile = "http://hl7.org/fhir/StructureDefinition/Observation"
* rest.resource[1].documentation = "Support for Observation resources - clinical observations and measurements"
* rest.resource[1].interaction[0].code = #read
* rest.resource[1].interaction[0].documentation = "Read an Observation resource by id"
* rest.resource[1].interaction[1].code = #search-type
* rest.resource[1].interaction[1].documentation = "Search for Observation resources"
* rest.resource[1].interaction[2].code = #create
* rest.resource[1].interaction[2].documentation = "Create a new Observation resource"
* rest.resource[1].searchParam[0].name = "patient"
* rest.resource[1].searchParam[0].type = #reference
* rest.resource[1].searchParam[0].documentation = "Search Observation by patient reference"
* rest.resource[1].searchParam[1].name = "code"
* rest.resource[1].searchParam[1].type = #token
* rest.resource[1].searchParam[1].documentation = "Search Observation by observation code"
* rest.resource[1].searchParam[2].name = "date"
* rest.resource[1].searchParam[2].type = #date
* rest.resource[1].searchParam[2].documentation = "Search Observation by observation date"