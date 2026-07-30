Instance: anw-v1.0.0
InstanceOf: OperationDefinition
Usage: #definition
* id = "anw"
* url = "http://nuts-foundation.github.io/nl-generic-anw-ig/OperationDefinition/anw"
* name = "anw"
* status = #active
* kind = #query
* description = "Custom named query on Patient used in the breaking the glass (BTG) flow, invoked with _query=anw. Requires a user context, mandates filtering on name and/or birthdate and limits the response via _elements."
* code = #anw
* resource[0] = #Patient
* system = false
* type = true
* instance = false

* parameter[0].name = #name
* parameter[0].use = #in
* parameter[0].min = 0
* parameter[0].max = "1"
* parameter[0].type = #string
* parameter[0].documentation = "Patient name filter. At least one of name or birthdate must be provided; they may also be combined."

* parameter[1].name = #birthdate
* parameter[1].use = #in
* parameter[1].min = 0
* parameter[1].max = "1"
* parameter[1].type = #date
* parameter[1].documentation = "Patient birth date filter. At least one of name or birthdate must be provided; they may also be combined."

* parameter[2].name = #_elements
* parameter[2].use = #in
* parameter[2].min = 1
* parameter[2].max = "1"
* parameter[2].type = #string
* parameter[2].documentation = "Data minimalization: the consumer limits the response to the fields needed for patient selection (name, address and birthDate). The bronhouder validates that this parameter is present."
