# Technical Implementation Time Registration - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* **Technical Implementation Time Registration**

## Technical Implementation Time Registration

# Technisch voorstel (eigen idee)

Datum 20 november 2025

# FHIR resources

## Tijdregistratie

Om tijdregistraties op een uniforme manier te kunnen versturen, maken we gebruik van FHIR STU3 en het [ChargeItem-resource](https://simplifier.net/packages/simplifier.core.stu3.resources/3.0.3/files/8278) .

De ChargeItem-resource beschrijft welke zorg een zorgverlener aan een patiënt heeft geleverd. Het gaat dus niet alleen om wat er geleverd is, maar ook om belangrijke details zoals hoeveelheid en welke organisaties of personen erbij betrokken waren. ChargeItem wordt vooral gebruikt om het declaratieproces soepel te laten verlopen.

Om de kwaliteit van de data te verbeteren, wordt er een nieuw profiel op deze resource gemaakt. In dat profiel maken we bepaalde velden zoals `occurence`, `quantity`, `performingOrganization` en `requestingOrganization` verplicht. Hierdoor weten we zeker dat we alle informatie binnenkrijgen die nodig is voor correcte en betrouwbare tijdregistratie.

Onderstaan de beschrijving van de velden

| | |
| :--- | :--- |
| ChargeItem.status | Geeft aan dat deze tijdregistratie declarabel is en als geleverd mag worden beschouwd. Is**billable.** |
| ChargeItem.code | De uursoort / type ANW-zorg waarop de tijd geboekt is. |
| ChargeItem.quantity | Het aantal geschreven minuten voor deze tijdregistratie, altijd in minuten. |
| ChargeItem.subject | De patient waar zorg aan is verleend |
| ChargeItem.participant | De zorgmedewerker |
| ChargeItem.performingOrganization | De zorgorganisatie die zorg heeft geleverd |
| ChargeItem.requestingOrganization | De zorgorganisatie waar de client hoort en waar naartoe gefactureerd moet worden. |
| ChargeItem.enteredDate | Datum en tijd van de tijd registratie wanneer deze is geregistreerd |

Voorbeeld FHIR resource:

```
{
  "resourceType": "ChargeItem",
  "meta": {
    "profile": [
      "http://example.org/fhir/StructureDefinition/chargeitem-anw"
    ]
  },
  "status": "billable",
  "quantity": {
    "value": 90,
    "system": "http://unitsofmeasure.org",
    "code": "min"
  },
  "subject": {
    "reference": "Patient/Client.123",
    "display": "J.A.C. Jansen"
  },
  "occurence": "2025-01-15T09:30:00+01:00",
  "participant": [
    {
      "role": {
        "coding": [
          {
            "system": "http://hl7.org/fhir/participant-role",
            "code": "performer"
          }
        ]
      },
      "actor": {
        "reference": "Practitioner/Employee.123",
        "display": "D. de Jong (Organisatie A)"
      }
    }
  ],
  "performingOrganization": {
    "reference": "Organization/Organization.789",
    "display": "Organisatie B"
  },
  "requestingOrganization": {
    "reference": "Organization/Organization.123",
    "display": "Organisatie A"
  },
}

```

Aangepast ChargeItem profiel waarbij bestaande velden verplicht zijn gemaakt.

```
Profile: ChargeItemAnw
Parent: ChargeItem
Id: chargeitem-anw
Title: "ChargeItem ANW"
Description: "ChargeItem-profiel voor ANW-registratie."

// Verplichte elementen
* quantity 1..1                   // quantity verplicht
* occurence 1..1                  // occurence verplicht ivm datum uitgevoerd werk
* performingOrganization 1..1     // uitvoerende organisatie verplicht
* requestingOrganization 1..1     // aanvragende / declarerende organisatie verplicht

* quantity ^short = "Aantal minuten ANW."
* occurence ^short = "De eind datum en tijd van werkzaamheden
* performingOrganization ^short = "Uitvoerende organisatie."
* requestingOrganization ^short = "Aanvragende organisatie."

```

Bij de keuze voor een passende FHIR-resource voor ANW-tijdregistraties is gekeken naar bestaande ZIB-profielen zoals [zib-Procedure](https://simplifier.net/nictizstu3-zib2017/zib-procedure) en [zib-Encounter](https://simplifier.net/nictizstu3-zib2017/zib-encounter) . Hoewel deze profielen uitstekend geschikt zijn voor hun oorspronkelijke doel — namelijk het vastleggen van medische handelingen (Procedure) of contactmomenten tussen cliënt en zorgverlener (Encounter) — sluiten ze onvoldoende aan bij de functionele eisen van ANW-tijdregistratie.

In de ANW-context draait het niet om het registreren van een medisch proces of een zorgcontact op zich, maar om het vastleggen van declarabele tijdseenheden, inclusief uursoort, aantal minuten, betrokken organisaties, verantwoordelijke medewerker en de administratieve/declaratieve context. Daarmee is het primaire doel geen verslaglegging van zorginhoud, maar het uitwisselen van factureerbare prestaties tussen systemen van verschillende leveranciers.

De ZIB-profielen voorzien niet in kernconcepten zoals:

* het onderscheid tussen uitvoerende en declarerende organisatie;
* een eenduidige plek voor de uursoort (productcode);
* een verplicht aantal minuten of uren dat gedeclareerd moet worden;
* de registratiedatum versus het daadwerkelijke zorgmoment;
* de administratieve en financiële verwerking van deze tijd.

Om die reden zouden zowel Procedure als Encounter moeten worden uitgebreid met meerdere extensies en afwijkende interpretaties, wat leidt tot inconsistenties, verwarring tussen leveranciers en een verhoogd risico op foutieve declaratiegegevens.

ChargeItem daarentegen is specifiek ontworpen voor het beschrijven van leveringen, prestaties en declarabele zorgactiviteiten. Het biedt standaard ondersteuning voor hoeveelheid, type prestatie (uursoort), uitvoerende partij, verantwoordelijke medewerker, patiëntcontext en administratieve metadata. Hierdoor sluit ChargeItem direct en semantisch juist aan op het ANW-tijdregistratieproces zonder dat er constructies of extensies nodig zijn die buiten de bedoeling van het model vallen.

Kortom: ChargeItem is niet alleen de best passende resource, maar ook de enige die de ANW-tijdregistratie op een gestandaardiseerde, uitwisselbare en declaratie-kloppende manier kan representeren. Hierdoor wordt een uniforme, toekomstbestendige implementatie mogelijk voor alle betrokken regio’s en leveranciers.

## Afweging alternatieve resources

Bij het bepalen van de juiste resource zijn ook andere FHIR-resources onderzocht:

### Encounter (FMM5–6)

* **Voordelen:** zeer volwassen, ondersteunt zorgcontact en organisatie.
* **Nadelen:** niet bedoeld voor declarabele tijd; minuten, uursoorten en declaratiecontext ontbreken.

### Procedure (FMM5)

* **Voordelen:** stabiel en breed gebruikt voor zorgactiviteiten.
* **Nadelen:** semantisch medisch; geen concept voor minuten of declaratie.

### Observation (FMM6)

* **Voordelen:** extreem flexibel.
* **Nadelen:** bedoeld voor metingen; vervuilt het klinisch dossier met administratieve data.

### Claim / Coverage / PaymentNotice / EligibilityRequest (Financial resources)

Deze resources zijn onderzocht vanuit het perspectief van declaratie en financiering:

#### Claim

* **Voordelen:** ontworpen voor formele declaraties richting een verzekeraar of andere externe “payer”.
* **Nadelen:** gaat uit van verzekerde zorg (Coverage), verzekeringsproducten en vaak landelijke declaratiestandaarden; past niet bij de interne ANW-tijdregistratie en onderlinge verrekening tussen organisaties binnen een regio. Te zwaar en te specifiek voor verzekeringsstromen.

#### Coverage

* **Voordelen:** geschikt om verzekeringsdekking te modelleren (verzekeraar, polis, dekkingsvorm).
* **Nadelen:** ANW-tijdregistratie in deze context is niet direct gekoppeld aan verzekeringsgegevens. Coverage voegt niets toe aan het bronmodel voor minutenregistratie en maakt de oplossing complexer zonder functionele meerwaarde.

### Conclusie

Hoewel deze resources technisch toepasbaar zouden kunnen worden gemaakt, sluiten ze semantisch niet aan op ANW-tijdregistratie. ChargeItem is de enige resource die natively ondersteunt:

* prestatie + tijdseenheid,
* uursoorten,
* uitvoerende en declarerende organisatie,
* medewerker + patiënt context.

Ondanks de lagere maturity in STU3 sluit ChargeItem inhoudelijk het beste aan. Met de maturity-stijging naar FMM1 in FHIR R5 lijkt de gekozen richting bovendien toekomstvast.

## Uursoorten

De uursoorten die binnen een regio gebruikt worden, worden regionaal vastgesteld. Zo kan bijvoorbeeld de regio Achterhoek eigen uursoorten hanteren, zoals NORMAL en EXTRA. Deze uursoorten moeten zowel bij de bronorganisatie als bij de uitvoerende zorgorganisatie correct worden geconfigureerd, zodat beide partijen dezelfde set uursoorten gebruiken.

Een juiste en eenduidige configuratie is essentieel: wanneer uursoorten onvolledig of onjuist zijn ingesteld, kan de tijdregistratie niet gevalideerd worden en is facturatie op basis van deze gegevens niet mogelijk.

