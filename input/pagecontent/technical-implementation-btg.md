# Breaking the glass voorstel (BTG)

Datum 15 April 2026

Voor de technische implementatie van breaking the glass (BTG) wordt er gebruik gemaakt van dezelfde technieken als bij de ANW maar is in het process geen regisseur aanwezig en daarmee het technisch process ook versimpeld. Breaking the glass betekend ook immers dat een medewerker toegang geeft aan zichzelf i.p.v. dit te laten gebeuren d.m.v. een aparte regisseur rol. Bij de breaking the glass functionaliteit komt dan ook geen ANW-Regisseur rol meer kijken en gaat het enkel nog tussen de ANW-Zorgverlener en ANW-Bronhouder.

De breaking the glass functionaliteit begint net als bij de reguliere ANW met het vastleggen van een expliciete toestemming door de ANW-Bronhouder aan de ANW-Zorgverlener. Dit gebeurt d.m.v. het volgende credential welke de bronhouder (eenmalig) moet uitgeven:
 ```json 
{
  "verifiableCredential": {
    "@context": [
      "https://nuts.nl/credentials/v1",
      "https://www.w3.org/2018/credentials/v1",
      "https://w3c-ccg.github.io/lds-jws2020/contexts/lds-jws2020-v1.json"
    ],
    "type": [
      "NutsAuthorizationCredential",
      "VerifiableCredential"
    ],
    "credentialSubject": {
      "id": "did:nuts:{Did van ANW-Zorgverlener}",
      "purposeOfUse": "BTG-Bronhouder-ZorgverlenerToegang",
      "resources": [
        {
          "operations": [
            "search"
          ],
          "path": "/Patient?_query=ANW-zorg",
          "userContext": false
        },
        {
          "operations": [
            "create"
          ],
          "path": "/notification",
          "userContext": false
        }
      ]
    },
    "proof": {
      "created": "2024-01-18T16:27:52.939738279+01:00",
      "jws": "eyJhbGciOiJFU......",
      "proofPurpose": "assertionMethod",
      "type": "JsonWebSignature2020",
      "verificationMethod": "did:nuts:Eb1U3ap94wcziQhUfZSW........"
    }
  }
}
```
Met deze credential weet een ANW-Zorgverlener systeem van wie die toegang heeft om breaking the glass toe te passen. 

Het vinden van de patienten waar een zorgverlener zich aan kan koppelen is nog een TODO om helder te krijgen. Hier is nog onduidelijkheid voor het uit te zoeken of gebruikers identeit toegevoegd zal worden bij het ophalen van de Patienten.

Nadat de juise Patient gekozen is, loopt het process op de manier afgebeeld in de sequentie diagram:
{% include img.html img="ANWSequence_btg.png" %}

Wat hier afwijkt van de reguliere ANW is dat hier gebruik gemaakt wordt van een afgeleide van de Task gedifineerd bij de ANW:
```json
{
  "resourceType": "Task",
  "id": "af10c4c8-bc4d-40c7-a335-fb63fe7158d3",
  "meta": {
    "profile": [
      "https://nuts.nl/fhir/StructureDefinition/nl-core-authorization-request"
    ]
  },
  "intent": "order",
  "code": {
    "coding": [
      {
        "code": "BTG-autorisatie-verzoek"
      }
    ]
  },
  "for": {
    "reference": "Patient/{patientId}",
    "display": "patient display name"
  },
  "authoredOn": "2024-01-23T13:23:42.1885689+00:00",
  "requester": {
    "agent": {
      "identifier": {
        "system": "http://nuts.nl",
        "value": "{DID ANW-Zorgverlener}"
      },
      "display": "ANW-Zorgverlener A"
    },
    "onBehalfOf": {
      "identifier": {
        "system": "http://nuts.nl",
        "value": "{DID authorizing party}"
      },
      "display": "Authorizing party C (data owner)"
    }
  },
  "owner": {
    "identifier": {
      "system": "http://nuts.nl",
      "value": "{DID accessing party}"
    },
    "display": "Accessing party B (data accessor)"
  },
  "reason": {
    "text": "{required user input of the zorgverlener}"
  },
  "restriction": {
    "period": {
      "start": "2024-01-23T14:23:42.2264869+01:00",
      "end": "2024-01-26T13:23:42.2295674+00:00"
    },
    "recipient": [
      {
        "reference": "Practitioner/{practitioner with access Id}",
        "display": "anw practitioner display name"
      }
    ]
  }
}
```

Het verschil hier tussen de fhir Task bij de ANW is dat deze een code heeft 'BTG-autorisatie-verzoek' welke gebruikt kan worden door de bronhouder om onderscheid te maken of het gaat om een normale ANW flow of BTG flow. Daarnaast is het reason text veld verplicht en zijn het geen instructies zoals het veld wordt gebruikt bij de reguliere ANW maar wordt verwacht dat hier door de gebruiker informatie wordt gevuld met wat de reden is voor het doen van een BTG.