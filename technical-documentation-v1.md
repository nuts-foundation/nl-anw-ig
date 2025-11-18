# Technical Documentation v 1 - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* **Technical Documentation v 1**

## Technical Documentation v 1

# ANW

# Inhoudsopgave

* [ANW](#anw)
* [Inhoudsopgave](#inhoudsopgave) 
* [Uitgeschreven proces flow](#uitgeschreven-proces-flow) 
* [Uitgangspunten](#uitgangspunten)
* [Woordenlijst](#woordenlijst)
* [NUTS-adresboek](#nuts-adresboek)
* [Regisseur vraagt de cliënt / medewerker gegevens op in alle ECD’s](#regisseur-vraagt-de-cliënt--medewerker-gegevens-op-in-alle-ecds) 
* [Omschrijving](#omschrijving)
* [Endpoints voor data regisseur](#endpoints-voor-data-regisseur)
* [Sequentie diagram](#sequentie-diagram)
* [Voorbeeld verifiable credential Regisseur (om cliënten/medewerkers op te halen)](#voorbeeld-verifiable-credential-regisseur-om-cliëntenmedewerkers-op-te-halen)
 
* [Onderstaande credential geeft het inzagesysteem uit.](#onderstaande-credential-geeft-het-inzagesysteem-uit)
* [Regisseur kent medewerker toe aan cliënt](#regisseur-kent-medewerker-toe-aan-cliënt) 
* [Omschrijving](#omschrijving-1)
 
* [Medewerker haalt gegevens op bij het bronsysteem](#medewerker-haalt-gegevens-op-bij-het-bronsysteem) 
* [Voorbeeld task](#voorbeeld-task)
* [Voorbeeld update task](#voorbeeld-update-task)
* [Voorbeeld verifiable credential Regisseur (get/put op task)](#voorbeeld-verifiable-credential-regisseur-getput-op-task) 
* [Bronhouder](#bronhouder)
* [Zorgverlener](#zorgverlener)
 
* [Voorbeeld verifiable credential bronhouder (informatie opvragen)](#voorbeeld-verifiable-credential-bronhouder-informatie-opvragen)
* [Endpoints voor data overdracht](#endpoints-voor-data-overdracht)
* [Sequentie diagram](#sequentie-diagram-1) 
* [Toelichting per stap](#toelichting-per-stap)
 
 
 
* [Logging](#logging)
* [Nuts register](#nuts-register) 
* [ANW-Regisseur](#anw-regisseur)
* [ANW-Bronhouder](#anw-bronhouder)
* [ANW-Zorgverlener](#anw-zorgverlener)
 
 
* [Versie beheer](#versie-beheer) 
* [Huidige versies](#huidige-versies)
* [Implementeren van een nieuwe versie](#implementeren-van-een-nieuwe-versie)
 
* [Uitbreidingen (gemaakt zonder versiebeheer)](#uitbreidingen-gemaakt-zonder-versiebeheer) 
* [Registeren van metingen](#registeren-van-metingen)
* [Foutafhandeling van registraties naar het brondossier](#foutafhandeling-van-registraties-naar-het-brondossier)
* [Woningtoegang](#woningtoegang) 
* [TODO](#todo) 
 
 

## Uitgeschreven proces flow

### Uitgangspunten

* De regisseur is op de hoogte van de medewerkersplanning. Dit kan bijvoorbeeld met Excellijsten die wekelijks gedeeld worden, zoals het al in de huidige situatie gebeurd. De implementatie die in dit document beschreven wordt, houdt geen rekening met het ontsluiten van de planning.
* Er is een samenwerkingsverband tussen de regisseur en de zorgaanbieders.
* Wij maken gebruik van directe aanroepen per Fhirresource en niet van compositions zoals bij de eOverdracht. Hiervoor is gekozen omdat de meest actuele gegevens nodig zijn voor de ANW-usecase. Zoals het ophalen van de laatste vijf rapportages.

### Woordenlijst

* **Regisseur**: De partij die de koppeling tussen de cliënten en ANW-zorgmedewerker maakt.
* **Bronsysteem**: Het systeem/zorgaanbieder waar de cliënt in bekend is.
* **Ontvanger**: Het systeem/zorgaanbieder waar de ANW-zorgmedewerker werkt.
* **ANW-Bronhouder**: is het bronsysteem
* **ANW-Zorgverlener**: is de ontvanger
* **ANW-regisseur**: is de regisseur
* **VC**: Verifiable credential
* **VP**: Verifiable presentation

### NUTS-adresboek

De regisseur heeft toegang tot het NUTS-adresboek, hierin kunnen de leveranciers voor elke organisatie die onderdeel uit maken het ANW-netwerk aanduiden dat de betreffende organisatie de service “ANW-Zorgverlener” en “ANW-Bronhouder” aanbiedt. De regisseur is zelf ook te vinden in het adresboek voor de bronhouder en zorgverlener om toegang te geven tot deze regisseur met als service “ANW-Regisseur”.

### Regisseur vraagt de cliënt / medewerker gegevens op in alle ECD’s

#### Omschrijving

De regisseur heeft een functionaliteit tot zijn beschikking waarmee hij eenvoudig cliënten en medewerkers met elkaar kan koppelen. Dit kan zowel zijn eigen ECD zijn als een applicatie van derden, zie onderstaande afbeelding.

Het uitgangspunt is dat de regisseur een eigen NUTS-node heeft draaien. De regisseur kan met behulp van zijn eigen node een access token opvragen om hiermee de cliënt- en medewerkergegevens van de verschillende zorgaanbieders op te vragen.

Deze zorgaanbieders vinden de regisseur door binnen het NUTS-adresboek op de service “ANW-Bronhouder” en “ANW-Zorgverlener” te filteren. Hiervan krijgt hij de endpoints terug die gebruikt kunnen worden om de informatie mee op te vragen.

Binnen dit access token wordt gespecificeerd wie de bevraging uitvoert. Wanneer er een samenwerkingsverband is, is het niet nodig vertrouwensniveau substantieel te gebruiken. Het bevragen van de cliënt en medewerker gegevens wordt door de regisseur geïnitialiseerd. Dit kan op eender welk moment plaatsvinden met een door de regisseur te bepalen frequentie.

Op basis van het ontvangen access token kan de zorgaanbieder bepalen tot welke endpoints de regisseur toegang heeft. Dit zijn voor deze usecase de volgende twee: [Endpoints voor data regisseur](#endpoints-voor-data-regisseur)

Als query wordt de query “ANW-zorg” meegegeven. Hiermee kan de zorgaanbieder bepalen welke cliënten/medewerkers teruggestuurd moeten worden.

Elke leverancier maakt het mogelijk voor organisaties om cliënten als "ANW" cliënt te kenmerken in hun ECD. Afspraak is dat alleen “In zorg” zijnde cliënten teruggegeven worden voor de ANW-usecase en ook alleen “In dienst (actief contract)” zijnde medewerkers teruggegeven worden voor de ANW-usecase.

Alle gekenmerkte cliënten worden teruggeven, onafhankelijk of er een BSN staat geregistreerd of niet. Het is de verantwoordelijkheid van de regisseur applicatie om cliënten die niet aan de door hun gestelde voorwaarden voldoen, niet te tonen.

De zorgaanbieder retourneert de lijst met cliënten en medewerkers aan de regisseur. Deze kan vervolgens de lijsten gebruiken om zelf te filteren op de gewenste cliënten / medewerkers.

#### Endpoints voor data regisseur

| | | |
| :--- | :--- | :--- |
| Patient | /fhir/Patient?_query=ANW-zorg | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954638](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954638) |
| Zorgmedewerker | /fhir/Practitioner?_query=ANW-zorg | [https://simplifier.net/nictizstu3-zib2017/nl-core-practitioner](https://simplifier.net/nictizstu3-zib2017/nl-core-practitioner) |

#### Sequentie diagram

#### Voorbeeld verifiable credential Regisseur (om cliënten/medewerkers op te halen)

Onderstaande credential wordt uitgegeven door het bronsysteem.

```
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
      "id": "did:nuts:{Did van regisseur}",
      "purposeOfUse": "ANW-Bronhouder-RegisseurToegang",
      "resources": [
        {
          "operations": [
            "search"
          ],
          "path": "/Patient?_query=ANW-zorg",
          "userContext": true
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

Onderstaand is een voorbeeld van een POST voor het aanmaken van deze credential:

```
{
  "issuer": "did:nuts:{DID van de bronhouder}",
  "type": "NutsAuthorizationCredential",
  "credentialSubject": {
    "id": "did:nuts:{Did van de regiseur}",
    "purposeOfUse": "ANW-Bronhouder-RegisseurToegang",
    "resources": [
      {
        "operations": [
          "search"
        ],
        "path": "/Patient?_query=ANW-zorg",
        "userContext": true
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
  "visibility": "private"
}

```

### Onderstaande credential geeft het inzagesysteem uit.

```
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
      "id": "did:nuts:{Did van regisseur}",
      "purposeOfUse": "ANW-Zorgverlener-RegisseurToegang",
      "resources": [
        {
          "operations": [
            "search"
          ],
          "path": "/Practitioner?_query=ANW-zorg",
          "userContext": true
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

Onderstaand is een voorbeeld van een POST voor het aanmaken van deze credential:

```
{
  "issuer": "did:nuts:{Did van de zorgverlener organisatie}",
  "type": "NutsAuthorizationCredential",
  "credentialSubject": {
    "id": "did:nuts:{did van de regisseur}",
    "purposeOfUse": "ANW-Zorgverlener-RegisseurToegang",
    "resources": [
      {
        "operations": [
          "search"
        ],
        "path": "/Practitioner?_query=ANW-zorg",
        "userContext": true
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
  "visibility": "private"
}

```

Voor het aanmaken van deze credentials moet door de leverancier een functionaliteit ontwikkeld worden waar voor de twee services rechten worden verleend aan een regisseur.

### Regisseur kent medewerker toe aan cliënt

#### Omschrijving

Wanneer de regisseur een medewerker en cliënt aan elkaar gekoppeld heeft, zal deze een “Task” aanmaken. Deze “Task” omschrijft dat er een “Verifiable credential” aangemaakt moet worden in het bronsysteem. Die task heeft als status “[Requested](https://www.hl7.org/fhir/STU3/valueset-task-status.html)”. Binnen de “Task” staat gedefinieerd voor wie en wat de credential uitgegeven moet worden.

De task houdt volgende in:

| | | | |
| :--- | :--- | :--- | :--- |
| Requester | Wie de autorisatie will aanmaken(ANW regisseur app) | Organization DID Regisseur App | DID |
| Authorizer | Bron systeem van wie de data(patient) is | Organization DID bronsysteem | DID |
| Accessor | Systeem wat de data gaat bevragen en tonen in een weergave (eigenaar Practitioner) | Organization DID partij met toegang tot de data | DID |
| PractitionerId | MedewerkerId die toegang heeft tot het systeem |   | ID |
| PatientId | Patiënt waar toegang voor verleend moet worden |   | ID |

Vervolgens maakt de regisseur een verifiable credential aan voor de Task waarmee aan het bronsysteem en het ontvangende systeem lees- en schrijfrechten worden gegeven. Aansluitend stuurt de regisseur een notificatie richting het bronsysteem waarmee de Task daar kenbaar gemaakt wordt.

Het bronsysteem maakt een verifiable credential aan met de gegevens in de task voor de medewerker-cliëntcombinatie. Die credentials hebben een geldigheidsduur van 48 uur. Deze geldigheidsduur staat beschreven in zowel de Task als de Nuts-autorisatiecredential.

In dit credential is gedefinieerd welke profielen bevraagd mogen worden. De profiel-URL’s die opgenomen zijn kunnen in het volgende hoofdstuk teruggelezen worden: [Endpoints voor data regisseur](#endpoints-voor-data-regisseur)

Zodra de credential gemaakt is, wordt deze automatisch (in de huidige opzet) binnen het NUTS netwerk kenbaar gemaakt. Het bronsysteem zet hierbij de status van de ontvangen “Task” op “[Ready](https://www.hl7.org/fhir/STU3/valueset-task-status.html)” bij de regisseur. Ook stuurt het bronsysteem het id van de uitgegeven verifiable credential mee in de PUT van de task. Deze id kan door de zorgverlener gebruikt worden om het juiste VC te zoeken en mee te sturen naar het bronsysteem. Hiermee wordt voorkomen dat meerdere VC’s door de zorgverlener worden verstuurd indien aan één cliënt meerdere medewerkers worden toegekend.

Zodra de task de status “Ready” krijgt, stuurt de regisseur een “Notify” naar de ontvanger. Binnen deze “Notify” is de task-id gedefinieerd waaronder het credential is aangemaakt. De notify specificeert richting de ontvanger dat medewerker X de gegevens van cliënt Y kan gaan opvragen in het bronsysteem.

### Medewerker haalt gegevens op bij het bronsysteem

Zodra de medewerker de gegevens wil inzien, zoekt het ECD of er een verifiable credential is uitgegeven. Nadat dit gevonden is authenticeert de medewerker zich via het niveau dat het bronsysteem heeft gespecificeerd bij de op te halen endpoints. Op het moment van schrijven zal altijd het niveau “Low” aangehouden worden. Eens geautoriseerd wordt er een Access token opgehaald waarmee de individuele endpoints bevraagd kunnen worden om de cliënt gegevens te krijgen. Het is de verantwoordelijkheid van de ontvanger dat alleen de medewerker uit de task de informatie in het bronsysteem ophaalt.

De endpoints die bevraagd worden zijn bepaald door de ECD-applicatie en niet door de endpoints in het “verifiable credential”. Voor nu houden wij hier de eerder gespecificeerde endpoints voor aan: [Endpoints voor data regisseur](#ANW-Regisseur)

Zodra het token opgehaald is, kan de ontvanger bij het bronsysteem de gegevens ophalen. Het bronsysteem gaat kijken of de ontvanger gemachtigd is via het credential om de gegevens op te halen. Dit gebeurt via de profielen in het credential. Indien de ontvanger niet gemachtigd is voor een endpoint krijgt hij hierop een “403 forbidden” terug.

Ervan uitgaande dat de ontvanger rechten heeft tot alle gegevens vastgesteld voor de ANW-usecase, worden de opgevraagde gegevens teruggestuurd naar de ontvanger. De ontvanger kan vervolgens de gegevens op een door hem gekozen manier tonen in zijn eigen ECD.

Voor nu is het bijwerken van de Task naar "Voltooid" buiten scope gelaten omdat het functionele gevolg hiervan nog niet helder is.

#### Voorbeeld task

```
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
        "code": "ANW-autorisatie-verzoek"
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
        "value": "{DID regiseur}"
      },
      "display": "Regiseur A"
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
    "text": "{optional user input of the regisseur}"
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

#### Voorbeeld update task

```
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
        "code": "ANW-autorisatie-verzoek"
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
        "value": "{DID regiseur}"
      },
      "display": "Regiseur A"
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
    "text": "{optional user input of the regisseur}"
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
  },
  "output": [
    {
      "type": {
        "coding": [
          {
            "system": "http://nuts.nl",
            "code": "vc-id"
          }
        ]
      },
      "valueString": "did:nuts:EwVMYK2ugaMvRHUbGFBhuyF423JuNQbtpes35eHhkQic#b53bda82-712a-4d20-b673-e67efaf60acc"
    }
  ]
}

```

Het bronsysteem stuurt in de update het ID van het aangemaakt VC mee, waarmee het bevragende systeem het juiste VC kan vinden voor het ophalen van de data.

#### Voorbeeld verifiable credential Regisseur (get/put op task)

Deze wordt uitgegeven door de regisseur, hiermee kan de ontvanger en bronsysteem de task die de regisseur klaarzet bijwerken. Hiervoor heb je er één voor de Bronhouder en één voor de Zorgverlener:

##### Bronhouder

```
{
  "verifiableCredential": {
    "@context": [
      "https://nuts.nl/credentials/v1",
      "https://www.w3.org/2018/credentials/v1",
      "https://w3c-ccg.github.io/lds-jws2020/contexts/lds-jws2020-v1.json"
    ],
    "credentialSubject": {
      "id": "did:nuts:{DID van bronhouder}",
      "purposeOfUse": "ANW-Regisseur-Autorisatieverzoek",
      "resources": [
        {
          "operations": [
            "read",
            "update"
          ],
          "path": "/Task/3b63dc7f-b4d2-49bf-b8ca-a91cdafdc464",
          "userContext": false
        }
      ]
    },
    "id": "did:nuts:AVoXh5Ls6kgFkENFqu6ag8jKgRVB9epvUoCuCTSqMKeb#f25de109-16bc-4323-bfda-dd36974777e1",
    "issuanceDate": "2023-09-26T08:05:52.83885377Z",
    "issuer": "did:nuts:AVoXh5Ls6kgFkENFqu6ag8jKgRVB9epvUoCuCTSqMKeb",
    "proof": {
      "created": "2023-09-26T08:05:52.839289486Z",
      "jws": "eyJhbGciOiJFUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il0sImtpZCI6ImRpZDpudXRzOkFWb1hoNUxzNmtnRmtFTkZxdTZhZzhqS2dSVkI5ZXB2VW9DdUNUU3FNS2ViI0N1alVqQWlSdU1MSHQ3RV9KcTlueUJfc0tMRjQxc1paRklMSklpVFZxeFEifQ..e01dnQNAJ00L_iPj-TsAZvqWZrEEkZV3IRB9pSdTJd-kCzk450qMrf1l-k7iJ-T3zp4zOr1MuqUR0XnUf3cdKg",
      "proofPurpose": "assertionMethod",
      "type": "JsonWebSignature2020",
      "verificationMethod": "did:nuts:AVoXh5Ls6kgFkENFqu6ag8jKgRVB9epvUoCuCTSqMKebCujUjAiRuMLHt7E_Jq9nyB_sKLF41sZZFILJIiTVqxQ"
    },
    "type": [
      "NutsAuthorizationCredential",
      "VerifiableCredential"
    ]
  }
}

```

##### Zorgverlener

```
{
  "verifiableCredential": {
    "@context": [
      "https://nuts.nl/credentials/v1",
      "https://www.w3.org/2018/credentials/v1",
      "https://w3c-ccg.github.io/lds-jws2020/contexts/lds-jws2020-v1.json"
    ],
    "credentialSubject": {
      "id": "did:nuts:{Did van zorgverlener}",
      "purposeOfUse": "ANW-Regisseur-Inzageverzoek",
      "resources": [
        {
          "operations": [
            "read",
            "update"
          ],
          "path": "/Task/3b63dc7f-b4d2-49bf-b8ca-a91cdafdc464",
          "userContext": false
        }
      ]
    },
    "id": "did:nuts:AVoXh5Ls6kgFkENFqu6ag8jKgRVB9epvUoCuCTSqMKeb#f25de109-16bc-4323-bfda-dd36974777e1",
    "issuanceDate": "2023-09-26T08:05:52.83885377Z",
    "issuer": "did:nuts:AVoXh5Ls6kgFkENFqu6ag8jKgRVB9epvUoCuCTSqMKeb",
    "proof": {
      "created": "2023-09-26T08:05:52.839289486Z",
      "jws": "eyJhbGciOiJFUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il0sImtpZCI6ImRpZDpudXRzOkFWb1hoNUxzNmtnRmtFTkZxdTZhZzhqS2dSVkI5ZXB2VW9DdUNUU3FNS2ViI0N1alVqQWlSdU1MSHQ3RV9KcTlueUJfc0tMRjQxc1paRklMSklpVFZxeFEifQ..e01dnQNAJ00L_iPj-TsAZvqWZrEEkZV3IRB9pSdTJd-kCzk450qMrf1l-k7iJ-T3zp4zOr1MuqUR0XnUf3cdKg",
      "proofPurpose": "assertionMethod",
      "type": "JsonWebSignature2020",
      "verificationMethod": "did:nuts:AVoXh5Ls6kgFkENFqu6ag8jKgRVB9epvUoCuCTSqMKeb#CujUjAiRuMLHt7E_Jq9nyB_sKLF41sZZFILJIiTVqxQ"
    },
    "type": [
      "NutsAuthorizationCredential",
      "VerifiableCredential"
    ]
  }
}

```

#### Voorbeeld verifiable credential bronhouder (informatie opvragen)

Deze wordt uitgegeven door de bronhouder. Hiermee kan de ontvanger het cliëntdossier opvragen.

```
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
      "id": "did:nuts:SjkuVHVqZndMVVJwcnUzbjhuZklhODB1M1M0LW9LcWY0WUs5S2",
      "purposeOfUse": "ANW-Bronhouder-Gegevensinzage",
      "resources": [
        {
          "operations": [
            "read"
          ],
          "path": "/Patient/{patientId}",
          "userContext": true
        },
        {
          "path": "/Observation?patient={patientId}&code=http://loinc.org|8310-5&date=gt{received-date-minus-3-days}",
          "operations": [
            "search"
          ],
          "userContext": true
        },
        {
          "path": "/Observation?patient={patientId}&code=http://loinc.org|85354-9",
          "operations": [
            "search"
          ],
          "userContext": true
        },
        {
          "path": "/Observation?patient={patientId}&code=http://loinc.org|8893-0",
          "operations": [
            "search"
          ],
          "userContext": true
        },
        {
          "path": "/Flag?patient={patientId}}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-Alert",
          "operations": [
            "search"
          ],
          "userContext": true
        },
        {
          "etc": "etc"
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

#### Endpoints voor data overdracht

Hieronder staan de endpoints die beschikbaar gesteld moeten worden door de partijen die toegang tot het ophalen en wegschrijven van data aan partijen die ANW-zorg verlenen. Ter verheldering zijn de kolommen Sort en Count toegevoegd om aan te tonen hoeveel resultaten er geretourneerd worden en op welke manier deze worden gesorteerd. Het is van belang dat bij een aanroep alle parameters gebruikt worden die in de tabel staan en ook geen extra. Dit heeft te maken met de controle die de systemen doen op de verifiable credentials. Die controle wordt op die manier gedaan om te voorkomen dat met een parameter zoals een include extra gegevens meekomen.

| | | | | | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Patiënt, Contactpersoon, Behandelaar(huisarts), Zorgaanbieder | GET |   |   | /fhir/Patient?_id={patientId}&_include=Patient:general-practitioner&_include:iterate=PractitionerRole:organization | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954638](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954638) |
| Bloeddruk | GET | Date DESC | 5 | /fhir/Observation?patient={patientId}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-BloodPressure&_sort=-date&_count=5 | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.3.1/files/2980633](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.3.1/files/2980633) |
| Hartslag | GET | Date DESC | 5 | /fhir/Observation?patient={patientId}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-PulseRate&_sort=-date&_count=5 | [https://simplifier.net/nictizstu3-zib2017/zib-pulserate](https://simplifier.net/nictizstu3-zib2017/zib-pulserate) |
| Lichaamstemperatuur | GET | Date DESC | 5 | /fhir/Observation?patient={patientId}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-BodyTemperature&_sort=-date&_count=5 | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954748](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954748) |
| Lichaamslengte | GET | Date DESC | 5 | /fhir/Observation?patient={patientId}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-BodyHeight&_sort=-date&_count=5 | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954746](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954746) |
| Lichaamsgewicht | GET | Date DESC | 5 | /fhir/Observation?patient={patientId}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-BodyWeight&_sort=-date&_count=5 | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954750](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954750) |
| Respiration | GET | Date DESC | 5 | /fhir/Observation?patient={patientId}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-Respiration&_sort=-date&_count=5 | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954947](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954947) |
| Rapportage | GET | Date DESC | 10 | /fhir/Observation?patient={patientId}&_profile=https://nuts.nl/fhir/StructureDefinition/nl-core-nursingreport&_sort=-date&_count=10 | [https://simplifier.net/anw/nl-core-nursi ngreport](https://simplifier.net/anw/nl-core-nursingreport) |
| Rapportage (aanmaken) | POST |   |   | /fhir/Observation | [https://simplifier.net/anw/nl-core-nursingreport](https://simplifier.net/anw/nl-core-nursingreport) |
| Woonsituatie | GET |   |   | /fhir/Observation?patient={patientId}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-LivingSituation | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954848](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954848) |
| Alerts | GET |   |   | /fhir/Flag?patient={patientId}}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-Alert | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954733](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954733) |
| Wilsverklaring | GET |   |   | /fhir/Consent?patient={patientId}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-AdvanceDirective | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954726](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954726) |
| Allergie | GET |   |   | /fhir/AllergyIntolerance?patient={patientId}&_profile=http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance | [http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance](http://nictiz.nl/fhir/StructureDefinition/zib-AllergyIntolerance) |

#### Sequentie diagram

##### Toelichting per stap

| | |
| :--- | :--- |
| 7 | Gebruikt hierbij het notificatie-endpoint dat gevonden is met de service "ANW-Bronhouder". In het AccessToken gebruik je de purposeOfUse "ANW-Bronhouder-RegisseurToegang" |
| 8 | Gebruikt hierbij het fhir-endpoint dat gevonden is met de service "ANW-Regisseur". In het AccessToken gebruik je de purposeOfUse "ANW-Regisseur-Autorisatieverzoek" |
| 10 | Gebruikt hierbij het fhir-endpoint dat gevonden is met de service "ANW-Regisseur". In het AccessToken gebruik je de purposeOfUse "ANW-Regisseur-Autorisatieverzoek" |
| 11 | Gebruikt hierbij het notificatie-endpoint dat gevonden is met de service "ANW-Zorgverlener". In het AccessToken gebruik je de purposeOfUse "ANW-Zorgverlener-RegisseurToegang" |
| 12 | Gebruikt hierbij het fhir-endpoint dat gevonden is met de service "ANW-Regisseur". In het AccessToken gebruik je de purposeOfUse "ANW-Regisseur-Autorisatieverzoek" |
| 15 | Het VC-ID dat in de uit stap 12 opgehaalde task kan gebruikt worden om de bijbehorende Verifiable credential te vinden. |
| 17 | Zie de[GET endpoints](#Endpoints-voor-data-overdracht). Afhankelijk van de implementatie per leverancier wanneer de GET requests worden uitgevoerd voor het opbouwen van het "ANW-Dossier" |

## Logging

Voor logging gaan we er vanuit dat implementeerders voldoen aan de huidige wet en regelgeving omtrent het inzien van medische gegevens.

## Nuts register

Hier staan de verschillende nutsservices die de verschillende partijen moeten registreren met daarbij de endpoints die ze beschikbaar moeten stellen.

### ANW-Regisseur

* Service: **ANW-Regisseur**

| | |
| :--- | :--- |
| fhir | Base fhir endpoint waar de Task opgehaald en geüpdatet kan worden. |
| oauth | Volledige URL van de n2n/auth/v1/accesstoken van de nutsnode van de regisseur |

### ANW-Bronhouder

* Service: **ANW-Bronhouder**

| | |
| :--- | :--- |
| fhir | Base fhir endpoint waar de patienten ontsloten worden voor de regisseur en waar de data opgehaald kan worden voor de “ANW-Zorgverlener” |
| oauth | Volledige URL van de n2n/auth/v1/accesstoken van de nutsnode van de bronhouder van de data |
| notification | Endpoint waar de notificatie naar toe gestuurd kan worden voor het verzoek om een autorisatie aan te maken voor een “ANW-Zorgverlener” |

### ANW-Zorgverlener

* Service: **ANW-Zorgverlener**

| | |
| :--- | :--- |
| fhir | Base fhir endpoint waar de Practitioners ontsloten worden waarop geautoriseerd kan worden |
| oauth | Volledige URL van de n2n/auth/v1/accesstoken van de nutsnode van de inzage applicatie |
| notification | Endpoint waar de notificatie naar toe gestuurd kan worden om mee te delen dat er een authorisatie door een “ANW-Bronhouder” is aangemaakt |

# Versie beheer

Voor versie beheer van de usecase wordt er gebruikt gemaakt van capability statements in FHIR. Een capability statement beschrijft alle functionaliteit die een FHIR server beschikbaar heeft. Het capability statement van de FHIR server is aan te roepen op het {baseUrl}/metadata endpoint. Dit endpoint moet publiekelijk, zonder authenticatie aan te roepen zijn.

**Hoe geef je als server aan welke versie van een rol ondersteund?**

Per unieke rol kan je aangeven welke versie je ondersteund van de specifieke rol. Het capability statement heeft een **instantiates** veld waarin meerdere url's kunnen worden vastgelegd. M.b.v. instantiates kan je verwijzen naar een capability statement die je FHIR server implementeerd. In deze documentatie hebben we de capability statements vastgelegd van de versies van de verschillende rollen die er zijn, deze zijn terug te vinden onder de [artifacts](artifacts.md). In het capability statement ziet dit er dan als voorbeeld als volgt uit wanneer een FHIR server ondersteuning biedt voor de ANW Bronhouder en ANW Zorgverlener rol:

```
{
  "resourceType": "CapabilityStatement",
  "instantiates": [
    "https://nuts-foundation.github.io/nl-anw-ig/CapabilityStatement-ANWBronhouderCapabilityStatement-v1.0.0.json",
    "https://nuts-foundation.github.io/nl-anw-ig/CapabilityStatement-ANWZorgverlenerCapabilityStatement-v1.0.0.json"
  ]
}

```

In het voorbeeld hierboven wordt er gebruik gemaakt van de versie van de ANW-Bronhouder rol die beschreven staat in het capability statement van wanneer je de link zou openen, in dit geval versie 1.0.0. Als software leverancier weet je op basis van welke URL's een andere partij in het instantiates heeft staan, welke versie van een rol die allemaal ondersteund.

## Huidige versies

|Rol | Versie | Url | artificat | |—-|——–|—–|———–| |ANW-Bronhouder| 1.0.0 | https://nuts-foundation.github.io/nl-anw-ig/CapabilityStatement-ANWBronhouderCapabilityStatement-v1.0.0.json | [link](CapabilityStatement-ANWBronhouderCapabilityStatement-v1.0.0.md) | |ANW-Zorgverlener|1.0.0 | https://nuts-foundation.github.io/nl-anw-ig/CapabilityStatement-ANWZorgverlenerCapabilityStatement-v1.0.0.json | [link](CapabilityStatement-ANWZorgverlenerCapabilityStatement-v1.0.0.md) | |ANW-Regisseur|1.0.0| https://nuts-foundation.github.io/nl-anw-ig/CapabilityStatement-ANWRegisseurCapabilityStatement-v1.0.0.json | [link](CapabilityStatement-ANWRegisseurCapabilityStatement-v1.0.0.md) |

## Implementeren van een nieuwe versie

Op het moment wanneer er een nieuwe functionaliteit voor een rol uitgedacht wordt, dan resulteert dit in een nieuwe versie van het capability statement. In de documentatie zal dan een nieuw hoofdstuk komen van de functionaliteit die nieuw is en welke nieuwe versies van het capability statement daarbij horen.

Wanneer een leverancier de nieuwe functionaliteit ontwikkeld heeft, dan kan deze de bijbehorende link naar het nieuwe capability statement toevoegen bij de instantiates, welke aangeeft dat de nieuwe functionaliteit beschikbaar is en de aanroepende kanten van het metadata hier op kunnen sturen.

**Let op**: We hebben afgesproken dat we altijd per rol slechts één versie aanbieden. Dus als er een nieuwe versie 2.x.x beschikbaar is die de leverancier ondersteunt, hoeft de leverancier alleen deze aan te passen in het meta endpoint.

Wanneer een nieuwe versie wordt geïmplementeerd, moet deze altijd backwards compatible zijn met de voorgaande versies. Dit betekent dat bestaande functionaliteit en koppelingen met eerdere versies blijven werken, zodat afnemers niet direct hoeven over te stappen.

## Versie controleren

Een aanvrager kan de versie van een rol controleren door binnen de instantie lijst in het meta endpoint alle IG met betrekking tot ANW uit te lezen en hier de versie te resolven. De versie kan geresolved worden door het versie veld binnen het capability statement uit te lezen. Als aanvrager kijk je dan dus of de versie gelijk of hoger is dan de versie waarvan je als aanvrager de functionaliteit ondersteund. Bijvoorbeeld als je als aanvrager versie 1.2.0 hebt en er komt versie 1.3.0 terug, dan doe je de vergelijking 1.3.0 > 1.2.0, wat betekent dat je als aanvrager alle functionaliteit die je hebt kan gebruiken. Is de versie van de aanvrager hoger is dan de versie van de leverancier, dan moeten er functionaliteiten verbogen worden.

# Uitbreidingen (gemaakt zonder versiebeheer)

## Registeren van metingen

Eerste uitbreiding op ANW is het registreren van metingen richting het brondossier. Om te registreren is geen uitbreiding nodig op de bestaande authorization credentials. Vanwege de tekstrapportage is de POST voor observation toegestaan. Het is aan de leverancier welke registraties beschikbaar zijn richting het brondossier voor de zorgverlener. Het brondossier **accepteert te allen tijde** een valide meting volgens de onderstaande Nictiz-profielen. Hoe het brondossier dit vervolgens verder verwerkt is aan de leverancier. De registratie zijn losse create requests per meting. Dit gebeurt in dezelfde stap als het registreren van de tekstrapportage. Voor de onderstaande drie metingen is gekozen vanwege wat er nu mogelijk is aan de ontvangende kant.

| | |
| :--- | :--- |
| Bloeddruk | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.3.1/files/2980633](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.3.1/files/2980633) |
| Lichaamstemperatuur | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954748](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954748) |
| Lichaamslengte | [https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954746](https://simplifier.net/packages/nictiz.fhir.nl.stu3.zib2017/2.2.10/files/1954746) |

## Foutafhandeling van registraties naar het brondossier

In het geval van een fout bij de registratie antwoord het bronsysteem met een OperationOutcome. Zie [Fout afhandeling/Handling Errors](https://informatiestandaarden.nictiz.nl/wiki/FHIR:V1.0_FHIR_IG_STU3#Handling_errors) in de implementatiegids van Nictiz. De [operation outcome](https://hl7.org/fhir/STU3/operationoutcome.html) kan door een systeem gebruikt worden om aan te geven richting de zorgverlener wat er fout is gegaan. In het geval van inhoudelijke fouten die niet zijn toegestaan volgens de Nictiz-profielen geeft de operationoutcome aan welke fout dit betreft. Zodat de zorgverlener de nodige aanpassing kan doen.

## Woningtoegang

Als er woningtoegang informatie beschikbaar is in het bronsysteem van de cliënt, dan is dit zeer nuttig om te delen met de zorgverlener. De location resource is hiervoor geschikt. De overweging is gemaakt dit niet in het adres van de cliënt te stoppen. Het patient.address veld is hier minder voor geschikt, omdat een nieuw profiel nodig zou zijn om te voorkomen dat woningtoegang mee kan komen met alle patiënten volgens het profiel nl-core-patients. Vooral een probleem buiten de usecase van ANW.

De location resource relateert niet direct met de cliënt. Het bronsysteem voegt de referentie naar die resource toe aan de inputs voor de task. Dit gebeurt in stap 12 van [het sequentiediagram](#sequentie-diagram-1) voordat de PUT-actie richting de regisseur is gedaan.

Het is belangrijk voor het zorgverlenersysteem dat de regisseur de inputs ook overneemt in de task. Dit betreft een absolute referentie. Zie hieronder een voorbeeld van input met de woningtoegang die binnen een task valt.

```
{
  "...": "...",
  "input": [
    {
      "type": {
        "text": "woningtoegang"
      },
      "valueReference": {
        "reference": "{FHIR-SERVER}/Location/101"
      }
    }
  ]
}

```

In de location resource moet de description gevuld zijn met de informatie om toegang tot de woning te verkrijgen. Zie het onderstaande voorbeeld met de relevante informatie.

```
{
  "resourceType": "Location",
  "id": "101",
  "description": "Sleutel onder de tuinkabouter"
}

```

### TODO

* `userContext` voor het opvragen van de lijst van Patient/Practitioner voor ANW-zorg moet duidelijk gemaakt worden: `true` of `false`? Mogelijk moet dit om data protection redenen op `true` (immers grote lijst van namen). Voordat dit duidelijk werd is bij een eerder technisch overleg overeengekomen voorlopig te gaan voor `false`, om (pre-)caching makkelijker te maken. Bij moment van schrijven op 24 juli 2024 worden de VCs bij alle partijen nog aangemaakt voor `false`, en vanuit Nedap worden de requests alvast altijd uitgevoerd met een aanwezige user context (in andere woorden, Nuts-elevatie is verplicht alvorens het regisseursscherm geopend kan worden) en gecached per user.

