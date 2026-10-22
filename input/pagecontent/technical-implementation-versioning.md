# Versionering (voorstel)

Dit voorstel beschrijft hoe ANW-systemen het **CapabilityStatement van de FHIR-server** als menukaart kunnen gebruiken. Hiermee maakt een leverancier zichtbaar welke aanvullende mogelijkheden het systeem binnen ANW aanbiedt, zoals bijvoorbeeld het ophalen en wegschrijven van een meting. Het systeem van de ANW-Zorgverlener haalt het CapabilityStatement van de ANW-Bronhouder op om te bepalen welke gegevens de bronhouder aanbiedt en welke handelingen deze kan verwerken. Zo weet het welke mogelijkheden het bij de bronhouder kan gebruiken.

Hiermee kunnen leveranciers onafhankelijk doorontwikkelen, ook buiten de functionaliteit die in de vaste ANW-afspraken zijn opgenomen. Een aanvullende mogelijkheid kan worden gebruikt zodra beide systemen deze ondersteunen en de benodigde toegang is verleend. De betrokken leveranciers hoeven daarvoor niet te wachten op een nieuwe ANW-versie of op implementatie door andere leveranciers.

## ANW-versies en de menukaart

De menukaart vormt een aanvulling op het [bestaande versiebeheer per ANW-rol](technical-documentation-v1.html#implementeren-van-een-nieuwe-versie). Volledige functionaliteiten met gezamenlijke proces- en implementatieafspraken, zoals [tijdregistratie](technical-implementation-time-registration.html) en [BTG](technical-implementation-btg.html), kunnen binnen ANW-versies worden gedefinieerd.

| Onderdeel | Doel |
| --- | --- |
| ANW-versie | Legt de gezamenlijke afspraken vast, waaronder volledige functionaliteiten zoals tijdregistratie en BTG. |
| Menukaart via het CapabilityStatement | Maakt zichtbaar welke mogelijkheden een systeem daadwerkelijk aanbiedt, waaronder aanvullende mogelijkheden die leveranciers onafhankelijk ontwikkelen. |

De afspraken van een ondersteunde ANW-versie blijven gelden. De menukaart maakt daarnaast zichtbaar welke aanvullende ZIB’s en handelingen beschikbaar zijn. Een leverancier kan bijvoorbeeld het registreren van een meting toevoegen en dit bekendmaken via het CapabilityStatement.

De [functionele uitwerking](https://docs.google.com/document/d/19m7vntWtGZFd7ynddN4wTdreIjeIfmXgjBNAzhV6eDU/edit?tab=t.0) voorziet de introductie van de menukaart in ANW-versie 1.4, waarbij ook tijdregistratie wordt meegenomen. Dit geeft aan wanneer de menukaart wordt geïntroduceerd, afzonderlijke aanvullende mogelijkheden kunnen leveranciers vervolgens onafhankelijk aanbieden.

## Ondersteuning bekendmaken

Iedere leverancier publiceert een correct en actueel CapabilityStatement voor de FHIR-server. Hierin staan de resources, profielen en handelingen die de server daadwerkelijk aanbiedt. Voor ANW moet duidelijk zijn welke daarvan binnen de ANW-usecase beschikbaar zijn.

Ook [360-graden](https://build.fhir.org/ig/nuts-foundation/nl-360-ig/vol2b.html) gebruikt het CapabilityStatement om de ondersteuning van de FHIR-server van een bronhouder op te vragen. Hetzelfde mechanisme kan binnen ANW worden gebruikt, met behoud van de eigen inhoudelijke afspraken.

### CapabilityStatement opvragen

Binnen de Nuts ANW-service publiceert de ANW-Bronhouder het FHIR-endpoint. Dit verwijst naar de FHIR-base waar de ANW-functionaliteit beschikbaar is. Het systeem van de ANW-Zorgverlener vraagt het bijbehorende CapabilityStatement op via het standaard metadata-endpoint:

```
GET [FHIR-base]/metadata
```

Het systeem gebruikt dezelfde FHIR-base voor de gegevensuitwisseling.

Een leverancier kan hiervoor een aparte FHIR-base inrichten. Bijvoorbeeld:

```
[server-url]/fhir/anw
```

Het bijbehorende metadata-endpoint is dan:

```
GET [server-url]/fhir/anw/metadata
```

Een aparte FHIR-base is een implementatiekeuze van de leverancier. De bestaande FHIR-base kan ook worden gebruikt. In beide gevallen verwijst het endpoint in de Nuts ANW-service naar de juiste base en biedt `[FHIR-base]/metadata` het bijbehorende CapabilityStatement aan.

Het CapabilityStatement maakt zichtbaar welke ZIB’s en aanvullende functies beschikbaar zijn, met de bijbehorende FHIR-profielen, handelingen en zoekmogelijkheden. De integrale ZIB’s en de bijbehorende profielen blijven leidend. De keuzevrijheid betreft welke ZIB’s en functies een systeem ondersteunt. De menukaart geeft geen keuze op veldniveau en biedt geen ruimte om de inhoud van een ZIB naar eigen inzicht aan te passen.

### Declaratieafspraken

Dit voorstel gebruikt de standaardvelden van FHIR STU3. De ANW-Bronhouder beschrijft de ondersteuning met de volgende velden:

| Onderdeel | Veld |
| --- | --- |
| Ondersteunde profielen | `CapabilityStatement.profile` |
| Resourcetype | `CapabilityStatement.rest.resource.type` |
| Overkoepelend profiel voor een resourcetype | `CapabilityStatement.rest.resource.profile` |
| Ondersteunde interacties, zoals `read`, `search-type` en `create` | `CapabilityStatement.rest.resource.interaction.code` |
| Zoekparameters | `CapabilityStatement.rest.resource.searchParam` |
| Operaties en named queries | `CapabilityStatement.rest.operation` |

In FHIR STU3 wordt ieder resourcetype per REST-modus één keer beschreven. De interacties gelden op het niveau van dat resourcetype. Een lijst met profielen en interacties legt daarom niet vanzelf vast welke interactie voor welk profiel beschikbaar is. Die koppeling moet nog worden uitgewerkt voor functies die hetzelfde resourcetype gebruiken. Zie [FHIR STU3 CapabilityStatement](https://hl7.org/fhir/STU3/capabilitystatement-definitions.html).

## Proces per taak

Het sequentiediagram toont wanneer het systeem van de ANW-Zorgverlener de ondersteuning van de ANW-Bronhouder opvraagt:

{% include img.html img="versioning-sequence.png" %}

Na de notificatie dat de Task klaarstaat, bepaalt het systeem van de ANW-Zorgverlener de FHIR-base via de Nuts ANW-service. Het haalt het CapabilityStatement op, bepaalt welke functies beschikbaar zijn en past de gebruikersinterface daarop aan. De gegevensuitwisseling verloopt vervolgens binnen de aangeboden functionaliteit en de verleende toegang.

## Beschikbare functionaliteit bepalen

Het systeem van de ANW-Zorgverlener vergelijkt de eigen ondersteuning met die van de ANW-Bronhouder. Het gebruikt daarvoor het resourcetype, het profiel en de bijbehorende interacties. Een functie is alleen bruikbaar als beide systemen de bijbehorende afspraken ondersteunen.

Als de ANW-Bronhouder bijvoorbeeld het lezen van bloeddrukmetingen ondersteunt, maar het aanmaken ervan niet, kan het systeem van de ANW-Zorgverlener bestaande metingen ophalen. Het kan dan geen nieuwe bloeddrukmeting bij de bronhouder registreren. De declaratieafspraken moeten dit onderscheid voor het betreffende profiel herkenbaar maken.

Voegt de ANW-Bronhouder het registreren van bloeddrukmetingen toe, dan maakt deze de ondersteuning bekend via het CapabilityStatement. Een systeem van de ANW-Zorgverlener dat deze mogelijkheid ook ondersteunt, kan die vervolgens gebruiken binnen de verleende toegang. Andere leveranciers kunnen deze mogelijkheid op een later moment implementeren.

Alleen de aanwezigheid van het resourcetype `Observation` of de interactie `create` is daarvoor onvoldoende: meerdere ZIB’s gebruiken dit resourcetype.

## Functionele afspraken en gezamenlijk testen

Onafhankelijke doorontwikkeling vraagt om gedeelde inhoudelijke afspraken waar de bestaande ZIB’s en profielen niet voldoende houvast bieden. Dit geldt bijvoorbeeld voor tijdregistratie, rapportage en functies waarvoor geen expliciete ZIB beschikbaar is. De betrokken leveranciers stemmen de betekenis en verwerking van deze functies af.

Leveranciers maken voor dergelijke functies ook gezamenlijke testafspraken, vooral wanneer meerdere interpretaties mogelijk zijn of de interoperabiliteit expliciet moet worden aangetoond. Het CapabilityStatement maakt de aangeboden ondersteuning zichtbaar, de gezamenlijke afspraken en tests onderbouwen dat de systemen de functie op dezelfde manier uitvoeren.

## Ondersteuning en toegang

Het CapabilityStatement beschrijft de mogelijkheden van het systeem. Het verleent geen toegang en zegt niet of voor een patiënt gegevens aanwezig zijn. De `NutsAuthorizationCredential` legt de verleende toegang vast. De ANW-Bronhouder controleert bij ieder verzoek of de gevraagde handeling binnen die toegang valt.

Als het CapabilityStatement niet kan worden opgehaald, neemt het systeem van de ANW-Zorgverlener geen nieuwe ondersteuning aan. Het gebruik van eerder opgehaalde informatie en de gevolgen voor lopende taken moeten nog worden vastgelegd.

Een uitbreiding van de aangeboden functionaliteit verruimt de toegang voor bestaande taken niet automatisch. Waar nodig beoordeelt de ANW-Bronhouder de overeenkomsten en autorisatie opnieuw.
