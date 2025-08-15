# MPG Use Case Realization - 20210902 Meeting notes

## Date

02 Sep 2021

## Participants

[Pascal Boullie <pascal.boullie@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) , Tel: 0151 46114243, Abteilung III

[Thomas Hucke <thomas.hucke@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) +49 89 1208-1463, SAP Expert from IKT

[Martin Schultheiß <martin.schultheiss@gv.mpg.de>](mailto:martin.schultheiss@gv.mpg.de), Archibus Expert

[anke.huelter@gv.mpg.de <anke.huelter@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#), Fachabteilungs-Verantwortliche für Archibus

### Session Hosts

Marcel Donges, Andre Marquis

## Goals

Clarification of next steps in order to use Archibus via API

## Discussion topics

| Time | Topic | Notes |
| --- | --- | --- |
| 15 min | Short intro | - Introduce purpose of use cases in order to prepare Mr. Schultheiß for further questions |
| 45 min | Archibus API discussion | - Discusss technical perspective and API access |

## Insights

- In order to have archibus together with WODA, there are 2 options
  1. Archibus contains WODA (as Tab) → Archibus cooperation is required
  2. WODA contains Archibus (as Tab) → I Frame access required => current target solution (Pascal)
- Archibus is used in MPG as SaaS
- Mr. Schultheiß recommend to use Q-nnect as data broker, not only for WODA but maybe for the whole of MPG
  - for demo purposes, csv dumps could be provided up to 2 times
  - will ask Archibus experts to provide IFrame solution
    - a) prefered from Mr. Schultheiß
    - b) prefered from Pascal
  - if Q-nnect works, this might be a good argument for MPG enterprise strategy
- Use Case 3 needs the decision on how WODA will be integrated into MPG environment
  - Mr. Schultheiß will discuss this on Monday in an internal meeting  
\-> Q-nnect + WODA + Archibus
- Link to Archibus Test Environment: [qs.mpg.cafms.de](http://qs.mpg.cafms.de)
  - PVS ID is internal personalized key for system access for pilot phase recommended
  - for business usage, SSO access is required (SAML based → simple SAML) → use case 5 !
- GeoID for institutes is available in Archibus → Mrs. Hülter
- Archibus requirements will be realized in August 2022 …, but csv data could be provided up front
- Prototype will be developed on external server (outside of MPG) to not block the delivery
- Teamraum required, but can also be provided centrally by WODA
- In order to stick to the idea of solving access involve SAP Christina Zepeck (SSO Responsible) [christina.zepeck@gv.mpg.de](mailto:christina.zepeck@gv.mpg.de)

## Action items

- [ ] do a meeting with Archibus experts → Mr. Schultheiß
- [ ] request pvs id (6 digits) from MPG → Pascal
- [ ] provide overall requirements in one document → Marcel
- [ ] provide MPG Teamroom → Pascal or Marcel…Offer and Decision Required
- [ ] ask Carmen Pantle to provide Linux Server in ‘Anforderungskreis’ → Pascal
- [ ] Invite for next regular meeting 16. Sept. 2021 14.00-16.00h → Johannes
- [ ] SSO Meeting planned for 09.09.21 13-14 Uhr → Pascal

## Decisions

- Use Case development will happen on external server, while efforts to access and deploy to MPG internal server will continue in parallel
- WODA will integrate Archibus by API and IFrame as needed in the corresponding Use Cases  
WODA acts as the main portal.
- Use Case 5 needed more or less as urgent precondition to UseCase 3 a, 3b: better call it  
Use Case 0!

### Email Correspondence

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

19/08/21 - 1/09/21

Hallo Thomas, Hallo Pascal

Ich hoffe ihr hattet bislang eine schöne Woche.

Gestern hatten wir die Gelegenheit nochmals mit Q-nnect zu sprechen. Diese haben uns, die im Anhang zu findenden Requirements, die wir brauchen um eure SAP Systeme  anzusprechen, weitergeleitet.

Wir klären noch in wie weit wir eine oberflächenfreie Version davon bekommen (also API basiert). Aber auch dafür werden die im Anhang  geforderten Zugänge benötigen. Insofern wäre es toll, wenn ihr euch schon einmal darum kümmern könntet. Vielen Dank!

Zudem wollten wir euch fragen ob ihr prüfen könnt, ob wir die original SAP Metadaten, welche Pascal benutzt hat um uns die Excel Auszüge aus dem DWH bereitzustellen, haben können.

Vielen Lieben Dank und habt noch einen schönen Abend,

Johannes Stadeler  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Hallo Johannes,

danke für Deine Mail.

Die Anforderungen habe ich an unser Netzwerk, Server und Security Referat zur Prüfung geschickt.

- D.h. zu Q! kommt noch die Qlik Analytics Plattform mit weiteren Lizenzkosten dazu? Sie läuft nur unter Ubuntu, nicht unter Debian?
- Welche SAP Lizenzen werden benötigt? - Die SAP Open Hub Lizenz?
- Wir sind schon auf BW/4HANA und planen die Umstellung auf S/4HANA (weg vom ERP). – wie sehen bei 4HANA die Voraussetzungen aus?
- Die Hardware-Anforderungen für WODA liegen uns noch nicht vor. - Wir rechnen mit ca. 60 Usern.

Danke

VG

Thomas Hucke  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Hallo Thomas,

Ich hoffe du hattest eine gute Woche!

Die ersten 3 Fragen werde ich an Q-nnect weiterleiten, und mit denen Klären. Ich werde dort nächste Woche nochmal auf dich zurück kommen.

Die WODA Anforderungen haben wir in den Mails bereits weitergeleitet, die sollten schon bei euch liegen, bitte nochmal schauen, wenn nicht schicke ich die mail auch gerne nochmal weiter.

Ich wünsche einen Happy Friday und ein tolles Wochenende,

Johannes Stadeler

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Hallo Thomas,

ich hoffe du hattest ein Schönes Wochenende.

Ich wollte noch zur Sicherheit die Woda Requirements weiterleiten. Ich denke das hat Marcel bereits getan aber doppelt hält besser:

**What is required to run ONCE / WODA on an own server**

- some naked linux distribution in its latest long term support version (LTS)
  - we like Ubuntu 20.04 LTS
  - we tested on
    - Debian
    - Arch Linux
    - Mac OSX
    - WSL 2 (Windows Subsystem for Linux V2 running one of the linux systems above)
- a latest docker runtime [Container Runtime](https://www.docker.com/products/container-runtime)
  - installed on the naked linux
    - e.g. on ubuntu: `sudo apt install docker.io`
    - test installation if `docker ps` command works and gives at least the following output  
`CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS`
  - docker should come with the command
    - `docker-compose up` or `docker compose up`
- if not further specified the linux should com with full “root" Rights

Freundlichste Grüße aus Berlin,  
Johannes Stadeler

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Guten Morgen Johannes,

danke fürs weiterleiten der Fragen an Q-nnect.

Für WODA haben wir jetzt nur das Betriebssystem bekommen – keine Hardware-Anforderungen: CPU,RAM, HDD?

Wichtig:

- Wir haben nur virtuelle Server, keine physischen.
- E-Mails werden generell über den MPG Mailserver verschickt.
- IKT liefert nur das OS: Alles on top (Docker und Co) muss der Hersteller (z.B. im Rahmen eines Workshops) mit unserem Dienstleister umsetzen.

Die HDD-Anforderungen für Q! und Q-nnect sind recht hoch. Werden Daten auf den Servern gespeichert?

Danke

VG

Thomas

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Guten Morgen Thomas,

Ich hoffe du hast einen guten Wochen Start erlebt!

Q-nnect hatte auf die Fragen geantwortet die ihr an uns geschickt hattet:

1. :D.h. zu Q! kommt noch die Qlik Analytics Plattform mit weiteren Lizenzkosten dazu? Sie läuft nur unter Ubuntu, nicht unter Debian?

Nicht das wir wüssten. Da wir das reine Woda basierte Frontend nutzen wird Qlik nicht genutzt und erzeugt somit keine weitere Kosten oder Requirements.

1. Welche SAP Lizenzen werden benötigt? - Die SAP Open Hub Lizenz?

Keine weiteren Lizenzen sing benötigt – Standard Zugang zu eueren ERP Systemen reicht aus

1. Wir sind schon auf BW/4HANA und planen die Umstellung auf S/4HANA (weg vom ERP). – wie sehen bei 4HANA die Voraussetzungen aus?

ERP oder 4Hana -  Plattform Q kann bei migrieren unterstützen.

Ich hoffe das hilft soweit. Bezüglich den Fragen aus der letzten Mail hole ich nochmal die Infos zusammen.

Freundlichste grüße aus Berlin,

Johannes Stadeler  
\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Hallo Thomas,

Ich hoffe du hast einen schönen Tag.

Zu den Hardware Anforderungen für WODA  wurde mir folgendes gesagt:

Es reichen 2 Core aus, und mehr als 8GB  Arbeitsspeicher seien nicht benötigt. Genauere Anforderung hat derzeit leider nur Marcel im Kopf, den werde ich dazu auch nochmal ansprechen wenn er aus seinem Urlaub zurück ist.

Das mit den Servern hört sich alles in Ordnung an. Dort würde ich vorschlagen das wir mit eurem Diensleistern zusammen einen Terminvereinbaren um Docker und Co aufzusetzen. Dazu benötigen wir lediglich euren Dienstleister mit der mit Rootrechten befehle eintippen kann, für ein knapp 30 minütigen call.

Wir können anbieten das im Anschluss von unserem Call am Sep. 2 zu machen.

  
Bezüglich der zweiten frage muss ich noch einmal bei Q! nachfragen um in Erfahrung zu bringen welche Daten bei denen gespeichert werden.

Ich hoffe das hilft, und Grüße aus Berlin,

Johannes Stadeler

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Hallo Thomas,

ich hoffe du hattest eine angenehme Woche.

Q-nnect hat auf die Fragen geantwortet und auch die Hardware Anforderungen für Plattform Q! mit uns geteilt. Hier die Antwort des SAP Experten bei Q-nnect:

„Nein, die Daten werden nicht auf den Severn gespeichert, wenn gewünscht kann ge-chached werden.

DIe HDD Anforderungen haben wir erst kürzlich hochgesetzt, um sicher zu sein, das es IMMER läuft, wenn bspw. mehrere Werke angeschlossen sind und zusätzlich eine Controlling Abteilung auch Daten zieht und bearbeitet.

Manche Kunden wollten ja bis zu 300 Millionen Datensätze laden ...

Also, es funktionieren natürlich auch die Mindestanforderungen (in gelb dargestellt):

|     |
| --- |
| **Server Anforderungen:** |
|     |

**Hardware** **Platform Q!**

**Hardware, Analytics Platform qlik (nicht relevant)**

CPU: x86\_64, 2GHz+, min. 8 Cores

CPU: x86\_64, 2GHz+, min. 8 Cores

RAM: 64 GB+ (min. 32 GB)

RAM: 32GB+ (min. 16GB)

\[optional\] RAM Mathe-Server: +8 GB

HDD: 1 TB+ (min. 500 GB)

HDD: 500 GB

**Software:**

**Software:**

OS: Ubuntu 18.04 headless oder CentOS8

OS: Microsoft Windows Server 2012 R2 oder 2016 oder 2019\* 

**Permissions: Root**

**Permissions: Root**

VG Roland“

Ich hoffe das hilft.  Wenn es noch Fragen gibt helfe ich gerne weiter

Freundliche Grüße aus Berlin,

Johannes Stadeler

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

Hallo Johannes,

ja. Wir haben noch die SAP IDM- und SSO-Anbindung von unseren letzten Meetings offen:

Die MPG hat die Vorgabe, dass bei allen neuen Systeme eine zentrale SAP IDM- und SSO-Anbindung möglich sein muss:

Die technische Lizenzverwaltung in WODA und Q! ist rein serverbezogen?

Lässt sich SAP IDM für die Benutzerverwaltung von WODA und Q! anbinden?

Funktioniert SSO mit WODA und Q! ?

- Gerne vereinbaren wir auch einen Termin mit dem IDM- und SSO-Team um Details zu klären.

Wie werden User und Passwörter in WODA und Q! gespeichert? – auf HDD oder in einer DB? – Verschlüsselung?

Die für „BW auf ERP“ gelisteten Modules aus der Datei „Platform-Q!-SAP-ERP-BW-Zugangsrechte\_de.pdf“ funktionieren noch auf on HANA, aber nicht mehr auf 4HANA. Da werden schlicht die Objekte Infocube und DSO nicht mehr eingesetzt.

Welche Voraussetzungen  gelten dann für den Datenzugriff auf 4HANA?

VG

Thomas

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Zusammenfassung 3. Sept 2021

Lieber Pascal, lieber Thomas,

ich hoffe ihr hattet eine schöne Woche.

Ich wollte in dieser Email kurz die gewünschten Punkte aus dem vergangenen Email Transfer zusammenfassen.

Themen:

1. HW Requirements
2. SSO Meeting
3. SAP HANA

## TOP 1: HW Requirements

### **What is required to run ONCE / WODA on an own server**

- some naked linux distribution in its latest long term support version (LTS)
  - we like Ubuntu 20.04 LTS (since Q! wants 18.04 that is also fine for us)
  - we tested on
    - Debian
    - Arch Linux
    - Mac OSX
    - WSL 2 (Windows Subsystem for Linux V2 running one of the linux systems above)
- a latest docker runtime [Container Runtime](https://www.docker.com/products/container-runtime)
  - installed on the naked linux
    - e.g. on ubuntu: `sudo apt install docker.io`
    - test installation if `docker ps` command works and gives at least the following output  
`CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS`
  - docker should come with the command
    - `docker-compose up` or `docker compose up`
- if not further specified the linux should com with full “root" Rights
- regarding: CPU, RAM, HDD - WODA has a very small footprint and does not add significat requirements: concluded you can choose the SMALLEST STD INSTANCE of your provider.

**Server Anforderungen für Plattform Q!**

**Hardware** **Platform Q!**

CPU: x86\_64, 2GHz+, min. 8 Cores

RAM: 64 GB+ (min. 32 GB)

HDD: 1 TB+ (min. 500 GB)

**Software:**

OS: Ubuntu 18.04 headless (oder CentOS8)

**Permissions:** **Root**

The server requirements set for Platfrom Q! are sufficient for all WODA server needs. If you meet the requirements for Q!, you will meet the requirements for WODA.

## TOP 2: SSO Meeting

### Fragen von Thomas Hucke

Die technische Lizenzverwaltung in WODA und Q! ist rein serverbezogen?

Lässt sich SAP IDM für die Benutzerverwaltung von WODA und Q! anbinden?  
Antwort: WODA hat 3 bestehende IAM Komponenten. Platform Q! kann SAP IDM anbinden und eine der drei WODA Komponenten kann Q! SSO. Die WODA Lego bausteine lassen sich also leicht zu einer Lösung zusammenstecken!

Funktioniert SSO mit WODA und Q! ?  
Antwort: Ja, für mehr als 5 verschiedene SSO und IAM (IDM) Standards. Funktioniert es für die MPG spezifische SSO Realisierung? Wahrscheinlich nicht out-of-the.box. Security ist immer konzernspezifisch! Daher ist das unten vorgeschlagenen Meeting nötig, damit wir lernen was bei euch alles zu beachten ist, dass ganz besonders ist als überall sonst auf der Welt.

- Gerne vereinbaren wir auch einen Termin mit dem IDM- und SSO-Team um Details zu klären.  
@Pascal sorgt bereits dafür, dass dieses Meeting organisiert wird. (Vrstl DO 09.09. 13-14 Uhr)

Wie werden User und Passwörter in WODA und Q! gespeichert? – auf HDD oder in einer DB? – Verschlüsselung?  
Antwort: WODA bindet Bausteine für unterschiedliche Technologien ein. WODA selbst speichert gar keine USER. Wie es der Baustein macht kommt auf den Baustein an, in dem Fall auf euer MPG SSO Realisierung.

## TOP 3: SAP Hana

### Fragen von Thomas Hucke

Die für „BW auf ERP“ gelisteten Modules aus der Datei „Platform-Q!-SAP-ERP-BW-Zugangsrechte\_de.pdf“ funktionieren noch auf on HANA, aber nicht mehr auf 4HANA. Da werden schlicht die Objekte Infocube und DSO nicht mehr eingesetzt.

Welche Voraussetzungen  gelten dann für den Datenzugriff auf 4HANA?

Antwort: Das müssen auch wir an Q-nnect durchreichen, oder haben Sie das schon gemacht Herr Hucke (lieber Thomas). Es wäre gut, wenn wir die Informationen an einem Fleck zusammentragen und sie euch als Hauptdienstleister bringen, anstatt dass es parallele Direktkommunikation und Verwirrung gibt.

Wir hoffen das hilft. Wenn es noch etwas gibt was ich weiterleiten kann lasst es mich gerne wissen.  
  
Happy Friday und Grüße aus Berlin,