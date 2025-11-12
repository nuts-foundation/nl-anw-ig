Instance: ANWZorgverlenerCapabilityStatement-v1.0.0
InstanceOf: CapabilityStatement
Usage: #definition
Title: "ANW Zorgverlener Capability Statement v1.0.0"
Description: "Capability statement describing the basic requirements for ANW FHIR servers (version 1.0.0, ANW-Zorgverlener)"
* url = "http://nuts-foundation.github.io/nl-generic-anw-ig/CapabilityStatement/ANW-Zorgverlener"
* version = "1.0.0"
* name = "ANW-Zorgverlener"
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
* description = "Version 1.0 capability statement defining the basic requirements for ANW FHIR servers wanting to support the ANW-Zorgverlener usecase."

// Server capabilities
* rest.mode = #server
* rest.documentation = "ANW FHIR Server v1.0 - supporting Patient resources with ANW-specific profiles"

// Practitioner resource support
* rest[0].resource[0].type = #Practitioner
* rest[0].resource[0].interaction[0].code = #search-type


//notification
* rest[0].operation[0].name = "zorgverlener-notification-endpoint"
* rest[0].operation[0].definition = "https://github.com/nuts-foundation/bolts/blob/master/anw/TD-ANWv2024.1.md#anw-zorgverlener"

* rest[0].operation[1].name = "ANW-zorg"
* rest[0].operation[1].definition = "http://nuts-foundation.github.io/nl-generic-anw-ig/OperationDefinition/ANW-zorg"
