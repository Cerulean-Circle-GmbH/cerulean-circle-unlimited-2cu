[📁 Max Planck Gesellschaft Mpg](../max-planck-gesellschaft-mpg.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/500000010/mpg-showcase-demo-202100622.md) | [🌐 Page Structure local SymLink](./mpg-showcase-demo-202100622.page.md)

# MPG Showcase Demo - 202100622

## Guests

[angelika.malinowski@gv.mpg.de <angelika.malinowski@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) Abteilungsleitung Abteilung III Forschungsbau und Infrastruktur

[Pascal Boullie <pascal.boullie@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) , Tel: 0151 46114243, Abteilung III

[Thomas Hucke <thomas.hucke@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) +49 89 1208-1463, SAP Experte

[Virginia Judy Kasten <virginia.kasten@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#), \[TBD\] → not in call

[Rudolf Oberholzner <rudolf.oberholzner@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#), Abteilung III

[Carmen Pantle <carmen.pantle@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) +49 89 1208-1572, IT Contact person for test server → not in call

[Alexander Seitz <alexander.seitz@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) 0049 171 5545932, IT Enterprise Architect

[Harald Suckfuell <harald.suckfuell@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#), IT Leiter

Date: 22.06.2021 10:00-11.30h

Subject: Software WO-DA

### Session Hosts

Marcel Donges, Andre Marquis

## Goal

Agree on a first Use Case example and start realization by using WODA

## Agenda

- Introduction (Updated introduction of new people in the round, 10 min)
- answer questions (if there are any unanswered left) (10 min)
- Introduce use case candidates (30 min +15 min Q&A)
- Actions (30 min)
- Next Steps (5 min)
- Feedback (5 min)

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Prerequisites - DONE

## Prerequisites

In order to realize a Use Case example, the following conditions must be met

- define use case candidates and clarify technical requirements  
\-> call with Angelika (20210512)  
\- three use case candidates would be more than enough  
\- as she is on holidays, we should contact Pascal (called on 202105129 and figure out these use cases  
\- in addition, we should have a little meeting with him (next week?) in order to clarify the technical requirements and ensure that these requirements will be met on 20210622 meeting  
\=> DONE

## Answer Questions

(if there are any unanswered left)

[MPG Rückfragen - 20210427](../max-planck-gesellschaft-mpg/mpg-rckfragen-20210427.md)

- Q: How does a secure SAP access look like with Woda?
  - Q-nnect demo incl. access details were shown
    - Mini demo on how example data will be transformed into domain objects

\=> add additional role ‘q-nnect’ user required

- Q: MPG access concept is transaction-based. I this an issue?  
\-> no issue, as all is a transaction => to be evaluated in UC 3
- Q: What is the benefit of this approach?
  - the advantage of web-based domain programming  
\-> independent from underlying technology
  - the consequent EAM structure conformity
  - Data are just cached (q-nnect reader), writing via (q-nnect writer)
- Q: How to access big data eg finance data performantly?  
\-> Data will be composed in real-time by lazy loading
- Q: What if there is no SAP view available?  
\-> As soon as the view is built, q-nnect can use it  
\-> Views can also be constructed on q-nnect level

## Introduce use case candidates

[MPG Showcase Demo Preparation - 202100520](../max-planck-gesellschaft-mpg/mpg-showcase-demo-preparation-202100520.md)

Review of the Data provided by [Pascal Boullie](https://ox.hosteurope.de/appsuite/#):

[MPG Showcase Demo Preparation - 202100527](../max-planck-gesellschaft-mpg/mpg-showcase-demo-preparation-202100527.md)

[https://2cu.atlassian.net/wiki/spaces/CCU/pages/901742597/Max+Planck+Gesellschaft+MPG#Artefakte](https://2cu.atlassian.net/wiki/spaces/CCU/pages/901742597/Max+Planck+Gesellschaft+MPG#Artefakte)

- UC 1-2 consists of mini-report widgets (incl. navigation from world to country to region)  
\-> should also introduce infrastructure
- UC3 requires data access
  - a virtual root server (any Linux is ok) with admin access within MPG Test environment is required  
\-> an already used VM with appropriate rights would also do it!
  - Access rights will be the same as for normal users (SSO is possible, but must be realized in the real project)  
\-> SAP SSO how to? => clarification required  
\-> In principle, WODA supports all access strategies but must be tailored to the appropriate company demand

## Insights

- SAP interface usage requires a license  
→ Not an issue regarding PoC as we are using already registered user accounts
- Only internal MPG admins do have admin rights (  
\=> we need a virtual root server  
- Mr. Seitz
  - In order to avoid delays due to MPG organizational issues  
\=> UC 3 can use Archibus data first and later SAP data (=> UC 4)  
- Mr. Suckfuell
  - In order to commission the use cases, Mrs. Malinowski can use the 'Einkaufswagen' request  
\=> Will be clarified in JourFix, together with Mrs. Malinowski, later today
  - Maschine provisioning takes 6 months, but  
\=> Mr. Suckfuell will figure out a creative and faster solution
  - If we can point out the uniqueness of this approach, this will help to get all required resources  
→ MPG will eventually do a market research  
→ Marcel confirms, that there is currently no other equivalent solution on the market
  - In order to deal with this long organizational MPG tasks  
\=> UC 3 will use Archibus data  
\=> Access to SAP will be prepared in parallel within MPG organization, starting right now  
\=> After SAP access provisioning an UC 3 based UC 4 will be realized. This time with SAP data  
- Mrs. Malinowski
  - Wants to see progress on PoC
  - As SAP data is possibly but not so urgent  
\=> PoC will start with UC 1 + 2 and UC 3 will first use Archibus  
\=> SAP access effort for the next steps must be performed in parallel, starting right now  
\=> An additional UC 4 will be realized after SAP access is given  
\=> Cerulean should provide offers for uc1-3 + uc4  
\=> uc1-3 within 8 weeks, after offer approval  
\=> uc4 later, on-demand?

## Actions

- Feedback to the Use Cases → DONE
- Understand the financials and frame for each of the Use Case realizations → DONE
- Defining the budget and scope for **an official PoC → DONE**

## Next Steps

Also derived from ‘=>’ in the information above

- Define the exact PoC timeline → DONE see above
- Provide Q&A Mail for Mr. Seitz again → DONE 20210624
- Drive the IT Infrastructure requirements in parallel
  - SAP access => additional role ‘q-nnect’ user for SAP required
  - MPG SAP access concept is transaction-based. I this an issue?  
\=> to be evaluated in UC 3
  - SAP SSO how to? => clarification required
  - WODA provisioning => virtual root server required
  - \=> Mr. Suckfuell will figure out a creative and faster solution
  - \=> SAP access effort for the next steps must be performed in parallel, starting right now
- \=> PoC will start with UC 1 + 2 and UC 3 will first use Archibus  
\=> An additional UC 4 will be realized after SAP access is given
- Provide individual offers for UC 1- 4
  - \=> UC 3 will use Archibus data
  - \=> UC 4 will use SAP data
  - \=> Budget clarification in JourFix, together with Mrs. Malinowski, later today (20210622)
- In order to ensure that customer demands are met, there must be reviews every 2 weeks after the start of development
  - At least one IT / PO representant must participate, but everybody is welcome
  - Pascal will organize these meetings

## Feedback

- Angelika
  - Good preparation, good proactive activities
  - A little fear about the financial dimensions ![(wink)](https://2cu.atlassian.net/wiki/s/1732347312/6452/9ec310e9ed617fde640b4372fb0e11f5501675fa/_/images/icons/emoticons/wink.png)
, but totally convinced, that the solution will perfectly support the daily business
  - Really wants the PoC use cases to be realized

## Communication

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

eMail 08.06 13:20

Hallo Herr Seitz, 

aus den uns vorliegenden MPG Unterlagen können wir Ihre Frage bzgl. welche SAP Systeme benötigt werden, wie folgt beantworten:

Laut Anhang PPT Seite 8 handelt es sich um HuR (Haushalt und Rechnungswesen), sowie um BW (Business Warehouse (Reporting)).

Um Ihnen einen ersten Eindruck zu vermitteln haben wir weiter unten die bisher bekannten Felder aus den Excel Export Auszügen von  
Herrn Boullie für Sie aufgeführt.

Zudem konnten wir Herrn Boullie für unseren heutigen Rückruf gewinnen. Dieser kann Ihnen sicher weitere Detailfragen sofort beantworten. 

Wir freuen uns schon auf das Gespräch um ca. 14h.  
Sollten wir sie nicht erwischen, können Sie auch gerne unter +49 152 53844085 direkt mit Herrn Donges Kontakt aufnehmen.  

Vielen Dank für Ihre Geduld und Unterstützung,

Die bisher identifizierten Felder aus:

- 210520\_MPG\_SAP.xlsx:

**Grunddatenblatt Bau SPM (GdB)**  
Sektion  
SAP-Kürzel  
Referat III  
AdB  
Status  
Vorhaben  
Maßnahme  
MiKateg  
Genehmigt  
Summe ist bis 2020  + Prognose ab 2021  
Ist bis 2020 teilbrutto  
Ist 2021 teilbrutto 001 - 016  
Plan ab  
 1 Plan 2021 teilbrutto Prognose  
 2 Plan 2022 teilbrutto Prognose  
 3 Plan 2023 teilbrutto Prognose  
 4 Plan 2024 teilbrutto Prognose  
 5 Plan 2025 teilbrutto Prognose  
 6 Plan 2026 teilbrutto Prognose  
 7 Plan 2027 teilbrutto Prognose  
 8 Plan 2028 teilbrutto Prognose  
 9 Plan 2029 teilbrutto Prognose  
10 Plan 2030 teilbrutto Prognose

- 210520\_MPG\_MPI-Listung.xlsx:

**MPI**

SAP-Kürzel

MPI

B-land

Standort

Sektion

Forschungsfeld

Baujahr

NUF 1-6  \[m²\]

Abteilungen \[Stk.\]

Reinräume  \[m²\]

ELMI  \[m²\]

NMR / MRT  \[m²\]

LASER  \[m²\]

Versuchshallen  \[m²\]

PFLANZEN  \[m²\]

TIERE \[m²\]

BIBLIOTHEK  \[m²\]

SUMME \[m²\]  
Anteil NUF  
Campus  
Eigentumsverhältnisse

Clusterbrief

Steckbrief

Aufnahme  Infrastruktur

Aufnahme ARCHIBUS

Sanierungs- konzept

Sanierungs- kosten  \[Mio € tb\]

Sonstiges

  
**Standorte**

Standort/ID Gliederungsebene 2

SAP-Kürzel

Sektion

Max-Planck-Institut für

Baujahr \[Datum\]

BGF  \[m²\]

NUF 1-6  \[m²\]

NUF / BGF  \[%\]

Stand PE \[Datum\]

Inhalt PE     \[Quelle\]

Reserve Grundfläche \[m²\]

Erweiterungspotential BGF \[m²\]

Erweiterungspotential  NUF 1-6 \[ m²\]

Potential BGF / BGF \[%\]

Baurecht

Eigentumsverhältnisse

Anmerkungen

**Gliederungsebene 1**

ID?

Standort

Summen Gliederungsebene 2

- BGF  \[m²\]
- NUF 1-6  \[m²\]
- NUF / BGF  \[%\]
- Reserve Grundfläche \[m²\]
- Erweiterungspotential BGF \[m²\]
- Erweiterungspotential  NUF 1-6 \[ m²\]
- Potential BGF / BGF \[%\]

**Gliederungsebene 2**

ID Gliederungsebene 2?

SAP-Kürzel

Sektion

Max-Planck-Institut für

Baujahr \[Datum\]

BGF  \[m²\]

NUF 1-6  \[m²\]

NUF / BGF  \[%\]

Stand PE \[Datum\]

Inhalt PE     \[Quelle\]

Reserve Grundfläche \[m²\]

Erweiterungspotential BGF \[m²\]

Erweiterungspotential  NUF 1-6 \[ m²\]

Potential BGF / BGF \[%\]

Baurecht

Eigentumsverhältnisse

Anmerkungen  
 

- 210520\_MPG\_Abteilungen.xlsx:

**Basistabelle**

Institut

SAP-Kürzel

Sektion

Standort

Bundesland

Forschungsfeld

Forschungsgebiet

Clusterinstitut

Anzahl Abteilungen

Abteilung

leerstehend

Bedarfsfaktor

Name Direktor\*in

Gender

Status Verfahren

NA

Finanzierung

Emeritierungsdatum

Emeritierung 2021

Emeritierung 2022

Emeritierung 2023

Emeritierung 2024

Emeritierung 2025

Emeritierung 2026

Emeritierung 2027

Emeritierung 2028

Emeritierung 2029

Emeritierung 2030

Abteilungsbudget (KF)

**Gliederungsebene 1**

Institut

SAP-Kürzel

manchmal leer

Sektion

Standort

Bundesland

Forschungsfeld

Forschungsgebiet

Clusterinstitut

Anzahl Abteilungen

leerstehend

Status Verfahren

**Gliederungsebene 2**

Abteilung

Bedarfsfaktor

Name Direktor\*in

Gender

NA

Finanzierung

Emeritierungsdatum

Emeritierung 2021

Emeritierung 2022

Emeritierung 2023

Emeritierung 2024

Emeritierung 2025

Emeritierung 2026

Emeritierung 2027

Emeritierung 2028

Emeritierung 2029

Emeritierung 2030

Abteilungsbudget (KF)

André Marquis

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

eMail 08.06

Hallo Herr Seitz, 

wir hoffen Sie hatten erholsame Feiertage. 

Nachdem wir bisher noch nichts von Ihnen gehört haben, scheint es um ein Vorabmeeting wohl eher schlecht zu stehen. 

Vielleicht könnten Sie uns aber dennoch sehr viel weiterhelfen indem Sie, oder einer Ihrer Kollegen uns eine kurze Einschätzung  
zu folgender Anforderung geben könnten: 

Für die praktische Umsetzung der Use Cases benötigen wir einen dedizierten Root Server im MPG Environment, einschließlich Nutzerrechte. Ein Zugang zum Intranet ist hierfür nicht erforderlich.

Auf diesem wird WODA und alle nötige Software per Skript installiert.   
Zudem benötigen wir Zugriffsrechte auf MPG Systeme (Archibus/DMS/SAP).  

Dabei sind wir besonders an folgenden Details interessiert:

1. Gibt es hierfür einen Standardvorgehen in der MPG und wie lange wird dies dauern?
2. Wie initiiert wir das möglichst zeitnah?
3. Welche Informationen benötigen Sie dafür von uns?

Erneut schon einmal vielen Dank für Ihre Unterstützung.

Beste Grüße, 

Johannes Stadeler

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

eMail 28.05

Sehr geehrter Herr Seitz,

wir hoffen es geht Ihnen gut und Sie hatten schöne Feiertage. Ich bin der Scrum Master bei Cerulean Circle und werde mich um das finden von weiteren Terminen kümmern.

Im März haben Andre Marquis und Marcel Donges, Ihnen und Ihren Kollegen von ITK in einem Meeting kurz WODA vorstellen können.

Ihr Feedback lautete: "Wenn Sie unser Interesse wecken wollten, dann ist ihnen das gelungen."

Daher werden wir uns ja am 22. Juni zu einem weiteren Meeting zusammenfinden um Demo Use Cases zu besprechen.

Gemeinsam mit Herrn Pascal Boullie, haben wir bereits damit begonnen uns dazu detailliertere Gedanken zu machen.

Dabei sind wir u. a. auf das Thema Datenzugang gestoßen. Um eine realitätsnah Umsetzung zu erhalten, wird es sicherlich nötig werden auf MPG Systeme zuzugreifen.

Erfahrungsgemäß kann so eine Zugangsbereitstellung in größeren Organisationen dauern...

Um hier die Zeit für uns arbeiten zu lassen, hat uns Frau Malinowski empfohlen Sie bereits vorab dazu zu konsultieren.

Ziel ist es die technischen Voraussetzungen bereits bis zu unserem gemeinsamen Treffen geklärt und im Idealfall bereitgestellt zu haben. 

Daher unsere Bitte um ein kurzes Vorab Meeting von max. 30 min. Natürlich auch gerne mit einem ihrer damit vertrauten Kollegen.

Wir freuen uns schon auf Ihre Terminvorschläge, wir sind flexible und im Voraus schon einmal Herzliches Dankeschön.

Freundlichste Grüße aus Berlin,

Johannes Stadeler
