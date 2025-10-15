Profile: NLPatient
Parent: Patient
Id: example-patient
Title: "Voorbeeld patient"
Description: "Patient profiel met verplicht BSN nummer."

* identifier 1..*
* identifier.system = "http://fhir.nl/fhir/NamingSystem/bsn" (exactly)
* identifier.value 1..1
* name 1..*
* gender 1..1
* birthDate 1..1