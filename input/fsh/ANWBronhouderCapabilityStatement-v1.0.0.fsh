Instance: ANWBronhouderCapabilityStatement-v1.0.0
InstanceOf: CapabilityStatement
Usage: #definition
Title: "ANW Bronhouder Capability Statement v1.0.0"
Description: "Capability statement describing the basic requirements for ANW FHIR servers  (version 1.0.0, ANW-bronhouder)"
* url = "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Bronhouder"
* version = "1.0.0"
* name = "ANW-Bronhouder"
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
* description = "Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Bronhouder usecase."

// Server capabilities
* rest.mode = #server
* rest.documentation = "ANW FHIR Server v1.0 - supporting Patient resources with ANW-specific profiles"

// Patient resource support
* rest.resource[0].type = #Patient
* rest.resource[0].interaction[0].code = #read
* rest.resource[0].interaction[1].code = #search-type
* rest.resource[0].searchInclude = "Patient:general-practitioner"
* rest.resource[0].searchInclude = "PractitionerRole:organization"
* rest.resource[0].searchParam[0].name = "_id"
* rest.resource[0].searchParam[0].type = #token

// Observation: PulseRate
* rest.resource[1].type = #Observation
* rest.resource[1].profile = "http://nictiz.nl/fhir/StructureDefinition/zib-PulseRate"
* rest.resource[1].interaction[0].code = #search-type
* rest.resource[1].searchParam[0].name = "patient"
* rest.resource[1].searchParam[0].type = #reference
* rest.resource[1].searchParam[1].name = "_profile"
* rest.resource[1].searchParam[1].type = #string
* rest.resource[1].searchParam[2].name = "_sort"
* rest.resource[1].searchParam[2].type = #string
* rest.resource[1].searchParam[3].name = "_count"
* rest.resource[1].searchParam[3].type = #number

// Observation: BloodPressure
* rest.resource[2].type = #Observation
* rest.resource[2].profile = "http://nictiz.nl/fhir/StructureDefinition/zib-BloodPressure"
* rest.resource[2].interaction[0].code = #search-type
* rest.resource[2].interaction[1].code = #create
* rest.resource[2].searchParam[0].name = "patient"
* rest.resource[2].searchParam[0].type = #reference
* rest.resource[2].searchParam[1].name = "_profile"
* rest.resource[2].searchParam[1].type = #string
* rest.resource[2].searchParam[2].name = "_sort"
* rest.resource[2].searchParam[2].type = #string
* rest.resource[2].searchParam[3].name = "_count"
* rest.resource[2].searchParam[3].type = #number

// Observation: BodyTemperature
* rest.resource[3].type = #Observation
* rest.resource[3].profile = "http://nictiz.nl/fhir/StructureDefinition/zib-BodyTemperature"
* rest.resource[3].interaction[0].code = #search-type
* rest.resource[3].interaction[1].code = #create
* rest.resource[3].searchParam[0].name = "patient"
* rest.resource[3].searchParam[0].type = #reference
* rest.resource[3].searchParam[1].name = "_profile"
* rest.resource[3].searchParam[1].type = #string
* rest.resource[3].searchParam[2].name = "_sort"
* rest.resource[3].searchParam[2].type = #string
* rest.resource[3].searchParam[3].name = "_count"
* rest.resource[3].searchParam[3].type = #number

// Observation: BodyHeight
* rest.resource[4].type = #Observation
* rest.resource[4].profile = "http://nictiz.nl/fhir/StructureDefinition/zib-BodyHeight"
* rest.resource[4].interaction[0].code = #search-type
* rest.resource[4].interaction[1].code = #create
* rest.resource[4].searchParam[0].name = "patient"
* rest.resource[4].searchParam[0].type = #reference
* rest.resource[4].searchParam[1].name = "_profile"
* rest.resource[4].searchParam[1].type = #string
* rest.resource[4].searchParam[2].name = "_sort"
* rest.resource[4].searchParam[2].type = #string
* rest.resource[4].searchParam[3].name = "_count"
* rest.resource[4].searchParam[3].type = #number

// Observation: BodyWeight
* rest.resource[5].type = #Observation
* rest.resource[5].profile = "http://nictiz.nl/fhir/StructureDefinition/zib-BodyWeight"
* rest.resource[5].interaction[0].code = #search-type
* rest.resource[5].searchParam[0].name = "patient"
* rest.resource[5].searchParam[0].type = #reference
* rest.resource[5].searchParam[1].name = "_profile"
* rest.resource[5].searchParam[1].type = #string
* rest.resource[5].searchParam[2].name = "_sort"
* rest.resource[5].searchParam[2].type = #string
* rest.resource[5].searchParam[3].name = "_count"
* rest.resource[5].searchParam[3].type = #number

// Observation: Respiration
* rest.resource[6].type = #Observation
* rest.resource[6].profile = "http://nictiz.nl/fhir/StructureDefinition/zib-Respiration"
* rest.resource[6].interaction[0].code = #search-type
* rest.resource[6].searchParam[0].name = "patient"
* rest.resource[6].searchParam[0].type = #reference
* rest.resource[6].searchParam[1].name = "_profile"
* rest.resource[6].searchParam[1].type = #string
* rest.resource[6].searchParam[2].name = "_sort"
* rest.resource[6].searchParam[2].type = #string
* rest.resource[6].searchParam[3].name = "_count"
* rest.resource[6].searchParam[3].type = #number

// Observation: NursingReport
* rest.resource[7].type = #Observation
* rest.resource[7].profile = "https://nuts.nl/fhir/StructureDefinition/nl-core-nursingreport"
* rest.resource[7].interaction[0].code = #search-type
* rest.resource[7].interaction[1].code = #create
* rest.resource[7].searchParam[0].name = "patient"
* rest.resource[7].searchParam[0].type = #reference
* rest.resource[7].searchParam[1].name = "_profile"
* rest.resource[7].searchParam[1].type = #string
* rest.resource[7].searchParam[2].name = "_sort"
* rest.resource[7].searchParam[2].type = #string
* rest.resource[7].searchParam[3].name = "_count"
* rest.resource[7].searchParam[3].type = #number

// Observation: LivingSituation
* rest.resource[8].type = #Observation
* rest.resource[8].profile = "http://nictiz.nl/fhir/StructureDefinition/zib-LivingSituation"
* rest.resource[8].interaction[0].code = #search-type
* rest.resource[8].searchParam[0].name = "patient"
* rest.resource[8].searchParam[0].type = #reference
* rest.resource[8].searchParam[1].name = "_profile"
* rest.resource[8].searchParam[1].type = #string
* rest.resource[8].searchParam[2].name = "_sort"
* rest.resource[8].searchParam[2].type = #string
* rest.resource[8].searchParam[3].name = "_count"
* rest.resource[8].searchParam[3].type = #number

// Flag resource
* rest.resource[9].type = #Flag
* rest.resource[9].profile = "http://nictiz.nl/fhir/StructureDefinition/zib-Alert"
* rest.resource[9].interaction[0].code = #search-type
* rest.resource[9].searchParam[0].name = "patient"
* rest.resource[9].searchParam[0].type = #reference
* rest.resource[9].searchParam[1].name = "_profile"
* rest.resource[9].searchParam[1].type = #string

// Consent resource
* rest.resource[10].type = #Consent
* rest.resource[10].profile = "http://nictiz.nl/fhir/StructureDefinition/zib-AdvanceDirective"
* rest.resource[10].interaction[0].code = #search-type
* rest.resource[10].searchParam[0].name = "patient"
* rest.resource[10].searchParam[0].type = #reference
* rest.resource[10].searchParam[1].name = "_profile"
* rest.resource[10].searchParam[1].type = #string

// AllergyIntolerance resource
* rest.resource[11].type = #AllergyIntolerance
* rest.resource[11].profile = "http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance"
* rest.resource[11].interaction[0].code = #search-type
* rest.resource[11].searchParam[0].name = "patient"
* rest.resource[11].searchParam[0].type = #reference
* rest.resource[11].searchParam[1].name = "_profile"
* rest.resource[11].searchParam[1].type = #string

// Operations
* rest.operation[0].name = "bronhouder-notification-endpoint"
* rest.operation[0].definition = "https://github.com/nuts-foundation/bolts/blob/master/anw/TD-ANWv2024.1.md#anw-bronhouder"

* rest.operation[1].name = "ANW-zorg"
* rest.operation[1].definition = "http://nuts-foundation.github.io/nl-generic-anw-ig/OperationDefinition/ANW-zorg"