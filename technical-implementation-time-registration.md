# Technical Implementation Time Registration - Netherlands - ANW implementation guide v0.1.0

* [**Table of Contents**](toc.md)
* **Technical Implementation Time Registration**

## Technical Implementation Time Registration

# Tijdregistratie (voorstel)

Datum 20 januari 2026

## FHIR resources

Om tijdregistraties op een uniforme manier te kunnen versturen, maken we gebruik van FHIR STU3 en het [ChargeItem-resource](https://simplifier.net/hl7.fhir.r3/chargeitem) .

De ChargeItem-resource beschrijft welke zorg een zorgverlener aan een patiënt heeft geleverd. Het gaat dus niet alleen om wat er geleverd is, maar ook om belangrijke details zoals hoeveelheid en welke organisaties of personen erbij betrokken waren. ChargeItem wordt vooral gebruikt om het declaratieproces soepel te laten verlopen.

Om de kwaliteit van de data te verbeteren, wordt er een nieuw profiel op deze resource gemaakt. In dat profiel maken we bepaalde velden zoals `occurence`, `quantity`, `performingOrganization` en `requestingOrganization` verplicht. Hierdoor weten we zeker dat we alle informatie binnenkrijgen die nodig is voor correcte en betrouwbare tijdregistratie.

Onderstaan de beschrijving van de velden

| | |
| :--- | :--- |
| ChargeItem.status | Geeft aan dat deze tijdregistratie declarabel is en als geleverd mag worden beschouwd. Is billable. |
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
      "http://example.org/fhir/StructureDefinition/nl-time-charge-item"
    ]
  },
  "status": "billable",
  "quantity": {
    "value": 90,
    "system": "http://unitsofmeasure.org",
    "code": "min"
  },
  "code": {
    "coding": [
      {
        "system": "https://nuts.nl/fhir/CodeSystem/anw-uursoort",
        "code": "NORMAL",
        "display": "Normaal"
      }
    ],
    "text": "Normaal ANW-tarief"
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
    "identifier": {
      "system": "http://nuts.nl",
      "value": "{DID performing organization}"
    },
    "display": "Organisatie A"
  },
  "requestingOrganization": {
    "identifier": {
        "system": "http://nuts.nl",
        "value": "{DID requesting organization}"
    },
    "display": "Organisatie B"
  }
}

```

Aangepast ChargeItem profiel waarbij bestaande velden verplicht zijn gemaakt.

```
Profile: NLTimeChargeItem
Parent: ChargeItem
Id: nl-time-charge-item
Title: "NL Tijdregistratie"
Description: "Generiek NL-profiel voor declarabele tijdregistraties op basis van ChargeItem."

// Verplichte elementen
* quantity 1..1
* occurence 1..1
* performingOrganization 1..1
* requestingOrganization 1..1

* quantity ^short = "Aantal geleverde minuten."
* occurence ^short = "De eind datum en tijd van werkzaamheden
* performingOrganization ^short = "Uitvoerende organisatie."
* requestingOrganization ^short = "Aanvragende organisatie."

```

Bij de keuze voor een passende FHIR-resource voor tijdregistraties is gekeken naar bestaande ZIB-profielen zoals [zib-Procedure](https://simplifier.net/nictizstu3-zib2017/zib-procedure) en [zib-Encounter](https://simplifier.net/nictizstu3-zib2017/zib-encounter) . Hoewel deze profielen uitstekend geschikt zijn voor hun oorspronkelijke doel, namelijk het vastleggen van medische handelingen (Procedure) of contactmomenten tussen cliënt en zorgverlener (Encounter), sluiten ze onvoldoende aan bij de functionele eisen van een tijdregistratie.

In de ANW-context draait het niet om het registreren van een medisch proces of een zorgcontact op zich, maar om het vastleggen van declarabele tijdseenheden, inclusief uursoort, aantal minuten, betrokken organisaties, verantwoordelijke medewerker en de administratieve/declaratieve context. Daarmee is het primaire doel geen verslaglegging van zorginhoud, maar het uitwisselen van factureerbare prestaties tussen systemen van verschillende leveranciers.

De ZIB-profielen voorzien niet in kernconcepten zoals:

* het onderscheid tussen uitvoerende en declarerende organisatie;
* een eenduidige plek voor de uursoort (productcode);
* een verplicht aantal minuten of uren dat gedeclareerd moet worden;
* de registratiedatum versus het daadwerkelijke zorgmoment;
* de administratieve en financiële verwerking van deze tijd.

Om die reden zouden zowel Procedure als Encounter moeten worden uitgebreid met meerdere extensies en afwijkende interpretaties, wat leidt tot inconsistenties, verwarring tussen leveranciers en een verhoogd risico op foutieve declaratiegegevens.

ChargeItem daarentegen is specifiek ontworpen voor het beschrijven van leveringen, prestaties en declarabele zorgactiviteiten. Het biedt standaard ondersteuning voor hoeveelheid, type prestatie (uursoort), uitvoerende partij, verantwoordelijke medewerker, patiëntcontext en administratieve metadata. Hierdoor sluit ChargeItem direct en semantisch juist aan op het tijdregistratieproces zonder dat er constructies of extensies nodig zijn die buiten de bedoeling van het model vallen.

Kortom: ChargeItem is niet alleen de best passende resource, maar ook de enige die de tijdregistratie op een gestandaardiseerde, uitwisselbare en declaratie-kloppende manier kan representeren. Hierdoor wordt een uniforme, toekomstbestendige implementatie mogelijk voor alle betrokken regio’s en leveranciers.

### Afweging alternatieve resources

Bij het bepalen van de juiste resource zijn ook andere FHIR-resources onderzocht:

#### Encounter (FMM5–6)

* **Voordelen:** zeer volwassen, ondersteunt zorgcontact en organisatie.
* **Nadelen:** niet bedoeld voor declarabele tijd; minuten, uursoorten en declaratiecontext ontbreken.

#### Procedure (FMM5)

* **Voordelen:** stabiel en breed gebruikt voor zorgactiviteiten.
* **Nadelen:** semantisch medisch; geen concept voor minuten of declaratie.

#### Observation (FMM6)

* **Voordelen:** extreem flexibel.
* **Nadelen:** bedoeld voor metingen; vervuilt het klinisch dossier met administratieve data.

#### Claim / Coverage / PaymentNotice / EligibilityRequest (Financial resources)

Deze resources zijn onderzocht vanuit het perspectief van declaratie en financiering:

#### Claim

* **Voordelen:** ontworpen voor formele declaraties richting een verzekeraar of andere externe “payer”.
* **Nadelen:** gaat uit van verzekerde zorg (Coverage), verzekeringsproducten en vaak landelijke declaratiestandaarden; past niet bij de interne ANW-tijdregistratie en onderlinge verrekening tussen organisaties binnen een regio. Te zwaar en te specifiek voor verzekeringsstromen.

#### Coverage

* **Voordelen:** geschikt om verzekeringsdekking te modelleren (verzekeraar, polis, dekkingsvorm).
* **Nadelen:** ANW-tijdregistratie in deze context is niet direct gekoppeld aan verzekeringsgegevens. Coverage voegt niets toe aan het bronmodel voor minutenregistratie en maakt de oplossing complexer zonder functionele meerwaarde.

### Conclusie

Hoewel deze resources technisch toepasbaar zouden kunnen worden gemaakt, sluiten ze semantisch niet aan op tijdregistratie. ChargeItem is de enige resource die natively ondersteunt:

* prestatie + tijdseenheid,
* uursoorten,
* uitvoerende en declarerende organisatie,
* medewerker + patiënt context.

Ondanks de lagere maturity in STU3 sluit ChargeItem inhoudelijk het beste aan. Met de maturity-stijging naar FMM1 in FHIR R5 lijkt de gekozen richting bovendien toekomstvast.

## Uursoorten

De uursoorten die binnen een regio gebruikt worden, worden regionaal vastgesteld. Een regio kan daarbij eigen uursoorten definiëren, zoals bijvoorbeeld NORMAL, EXTRA en CONSULT. Deze afspraken gelden voor zowel bronorganisaties als uitvoerende zorgorganisaties en vormen de basis voor tijdregistratie en declaratie.

Om correcte validatie en facturatie mogelijk te maken, is het essentieel dat beide partijen dezelfde set uursoorten hanteren. Wanneer uursoorten ontbreken of onjuist zijn geconfigureerd, kan de tijdregistratie niet gevalideerd worden en is facturatie op basis van deze gegevens niet mogelijk.

#### Regionale afspraken versus systeemimplementaties

Hoewel uursoorten regionaal gezamenlijk worden afgesproken, hebben individuele systemen niet altijd alle afgesproken uursoorten geïmplementeerd. Een bronsysteem kan bijvoorbeeld regionaal afgesproken uursoorten NORMAL, EXTRA en CONSULT ondersteunen, maar in de praktijk slechts NORMAL en EXTRA hebben geconfigureerd.

Om dit verschil tussen regionale afspraak en feitelijke systeemondersteuning eenduidig uit te wisselen, is het noodzakelijk om bij het bronsysteem op te kunnen vragen welke subset van uursoorten daadwerkelijk beschikbaar is.

#### Gebruik van FHIR ValueSet

Voor deze uitwisseling wordt gebruikgemaakt van een FHIR ValueSet die door het bronsysteem wordt gepubliceerd. Deze ValueSet bevat **exact de uursoorten die in het betreffende systeem aanwezig en geconfigureerd zijn**.

Door deze ValueSet via FHIR op te vragen, kan het ontvangende systeem vaststellen:

* welke regionaal afgesproken uursoorten ondersteund worden;
* welke uursoorten ontbreken;
* welke uursoorten valide gebruikt mogen worden in tijdregistratie en declaratie.

#### Lichtgewicht terminologiemodel

In deze aanpak is bewust gekozen voor een lichtgewicht toepassing van het FHIR-terminologiemodel:

* er worden **geen CodeSystem-resources gepubliceerd of beheerd**;
* er wordt **één uniforme system-URI** gebruikt voor alle ANW-uursoorten;
* elk bronsysteem publiceert **een eigen ValueSet** met daarin de door dat systeem ondersteunde subset van uursoorten binnen de regio afspraken.

Deze werkwijze maakt het mogelijk om zonder extra beheer of centrale synchronisatie nauwkeurig te bepalen welke uursoorten binnen een regio bij een bronsysteem beschikbaar zijn.

## Ophalen van de uursoorten ValueSet

Voor het ophalen van de uursoorten die het bronsysteem daadwerkelijk ondersteunt, wordt gebruikgemaakt van de FHIR-terminologie-operatie **`$expand`**. Met deze operatie kan een systeem dynamisch de volledige lijst met beschikbare uursoorten opvragen.

### Waarom $expand

Een FHIR ValueSet beschrijft welke codes geldig zijn, maar bevat in zijn definitie niet altijd een expliciete opsomming van deze codes. De [$expand](https://fhir.hl7.org/fhir/valueset-operation-expand.html) operatie zorgt ervoor dat het ValueSet wordt uitgewerkt tot een concrete lijst van codes, gebaseerd op de interne configuratie van het bronsysteem.

Het ontvangende systeem hoeft hierdoor:

* geen aannames te doen over beschikbare uursoorten;
* geen filters of interne configuraties te interpreteren;
* geen aanvullende terminologiebronnen te beheren.

De response is direct bruikbaar voor validatie, gebruikersinterfaces en declaratieprocessen.

**Request**

```
GET https://bronhouder.example.org/fhir/ValueSet/$expand
  ?url=https://bronhouder.example.org/fhir/ValueSet/anw-uursoorten

```

```
curl -X GET \
  "https://bronhouder.example.org/fhir/ValueSet/\$expand?url=https://bronhouder.example.org/fhir/ValueSet/anw-uursoorten" \
  -H "Accept: application/fhir+json"

```

De url parameter verwijst naar de canonieke identificatie van het ValueSet en geeft functioneel aan:

> “Geef de volledige lijst met uursoorten terug die horen bij dit ValueSet, zoals deze in dit bronsysteem beschikbaar zijn.

**Response** De response bevat een FHIR ValueSet resource met daarin een expansion. Dit element bevat de expliciete lijst van uursoorten die door het bronsysteem worden ondersteund.

```
{
  "resourceType": "ValueSet",
  "url": "https://bronhouder.example.org/fhir/ValueSet/anw-uursoorten",
  "expansion": {
    "contains": [
      {
        "system": "https://nuts.nl/fhir/CodeSystem/anw-uursoort",
        "code": "NORMAL",
        "display": "Normaal"
      },
      {
        "system": "https://nuts.nl/fhir/CodeSystem/anw-uursoort",
        "code": "EXTRA",
        "display": "Extra"
      }
    ]
  }
}

```

In dit voorbeeld ondersteunt het bronsysteem uitsluitend de uursoorten NORMAL en EXTRA, terwijl regionaal mogelijk meer uursoorten zijn afgesproken. Het ontvangende systeem kan deze informatie gebruiken om alleen valide en ondersteunde uursoorten toe te passen.

#### Context afhankelijke uursoorten (toekomst)

Omdat we de tijdregistratie en uursoorten generiek willen houden binnen de zorg-toepassingen, en er in de toekomst mogelijk behoefte ontstaat om uursoorten patiënt afhankelijk terug te geven (bijvoorbeeld vanwege cliënt-specifieke regels), hebben we onderzocht of FHIR STU3 dit ondersteunt binnen het gebruik van ValueSets.

Binnen FHIR is dit technisch geen probleem. De STU3-specificatie staat toe dat operaties, waaronder ValueSet/$expand, worden uitgebreid met optionele, server-specifieke parameters. Deze parameters kunnen gebruikt worden om extra context mee te geven, zoals:

* de patiënt (patient=Patient/123);
* de regio

FHIR bepaalt dat onbekende parameters genegeerd moeten worden door servers die deze niet ondersteunen, waardoor dit mechanisme backwards compatible blijft. Dit betekent dat wij veilig een optionele parameter kunnen introduceren om de context van de patiënt mee te geven zonder dat dit invloed heeft op bestaande implementaties.

Een voorbeeld van een contextuele $expand-aanroep:

```
GET https://bronhouder.example.org/fhir/ValueSet/$expand
    ?url=https://bronhouder.example.org/fhir/ValueSet/anw-uursoorten
    &patient=Patient/123

```

```
curl -X GET \
  "https://bronhouder.example.org/fhir/ValueSet/\$expand?url=https://bronhouder.example.org/fhir/ValueSet/anw-uursoorten&patient=Patient/123" \
  -H "Accept: application/fhir+json"

```

