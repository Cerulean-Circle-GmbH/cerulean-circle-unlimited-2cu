# MPG Use Case Realization - 20211105 Meeting notes

## Date

05 Nov 2021

## Participants

[Pascal Boullie <pascal.boullie@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) , Tel: 0151 46114243, Abteilung III

### Session Hosts

Marcel Donges, Andre Marquis

## Goals

Discuss and understand Unique Selling Propositions (USPs)

## Discussion topics

| Time | Topic | Notes |
| --- | --- | --- |
| 15 min | USP discussion | - Explain Usp's in order to be able to ‘sell’ it to MPG members |
| 2.45 h | USP translation | - Translation of USP to German and enahancing details |

## Insights

Q-nnect → Very cost efficient data access equivalent to HANA/ DWH

Once → Operating system, that abstracts all infrastructure and systems away (Virtual Machine for the Web)

Woda → Components for everything, starting from Enterprise Architecture Layer (EAM) Layer 1 to 5, running on Once

\=> Massive time and cost savings regarding operation and adoption (new requirements)

### Cutomers current target and future vision

- Use a few different data source systems and show processed results with widgets
- Have Woda for 25 use cases and keep the opportunity to easely expand later with low additional effort

### Enterprise software (ES)

- Describe the difference between Woda and other Enterprise software products. What is the USP?
  - ES needs maximum Hardware
  - Woda is like ES, but with requirements of a small app, regarding hardware, software and effort

### Woda- / Q-nnect-USPs and a translation into German

- **Q-nnect**
  - simple SAP access
    - graphical configuration / low code
  - universal business objects (UBO) mapped to separately exchangeable data sources
    - so a simple Excel Export can be used as Mock-Up and later be exchanges by the real data access without affecting the Applications written in WODA
  - UBO exposure as self-describing REST-Services and JSON data
  - UBO market place to share UBOs and their mappings across business partners
  - Einfachen Firmen wie WODA günstigen unkomplizierten Zugang zu SAP von anderen Firmen gibt, ohne, dass CC einen SAP ertrag braucht.
- **WODA**
  - [EAM](../../../../cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository.md) incorporated in the programming language and environment for large scale
    - Enterprise Architecture Management in 5 separate Layers  
covering all Business Model aspects
    - fast and easy Enterprise Integration of existing or even outdated IT assets of all EAM layers
  - [UCP](../../../../cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository/ucp.md) Components for reusable drag & drop of IT assets
  - decentral Software Installation and Configuration Repository for UCP Component lookup and distribution  
(z.B [https://test.wo-da.de/EAMD.ucp/Components/com/canvas-gauges/CanvasGauges/2.1.7](https://test.wo-da.de/EAMD.ucp/Components/com/canvas-gauges/CanvasGauges/2.1.7) [https://woda.q-nnect.com/EAMD.ucp/Components/de/mpg/MpgDashboard](https://woda.q-nnect.com/EAMD.ucp/Components/de/mpg/MpgDashboard))
  - first ever Machine to Machine (M2M) communication **Kernel ONCE** build on top of a first M2M programming language named Thinglish, that executes on simple standard JavaScript and therefore enables the Write-ONCE-Deploy-Anywhere (WODA) principles
  - Thinglish is the only programming language that supports software component versions directly from the language through namespaces and up to the UCP deployment artifacts
    - immanent software component version management
  - Vendor, Browser and Device independent reusable software for investment protection
  - Single source for Mobile, Desktop and Enterprise Server

#### **German USP Table**

| **LNR** | **Kunden Bedarf** | **Feature USP** | **aktuelle Situationen auf Kundensicht** | **Nutzen für den Kunden** |
| --- | --- | --- | --- | --- |
| 1   | Ich will als fachlicher Spezialist (Bauarchitekt) nicht erst IT Spezialist werden müssen um meine Datenquellen in SAP BW oder SAP Hana bearbeiten zu können | Enterprise Strukturen simple erfüllt.  <br>Repository ist nur ein einfaches Filesystem.  <br>Sauberer strukturiert als große Governance Tools.  <br>Alles per Drag und Drop benutzbar. | Aktuell müssen die Datenquellen von IT Spezialisten in den Systemen angelegt werden. Dazu sind lange komplizierte Prozesse zwischen den Fach- und IT- Abteilungen notwendig. | Große Consulting- und Spezialisten Abteilungen werden für diese einfachen fachlichen Anpassungen nicht benötigt, sondern normale Web Programmierer können das direkt in der Bauabteilung erledigen. |
| 2   | Einfacher Zugang zu vielen Datenquellen an nur einem Ort | Der fachliche Spezialist (Bauarchitekt) kann ein Excel File aus den SAP Systemen extrahieren und solange nutzen bis die IT Spezialisten die gleiche Logik offiziell zur Verfügung stellen können.<br><br>Dabei kann das viel günstigere Q-nnect, das Excel vorerst wie ein echtes SAP System behandeln und später leicht durch das echte SAP System austauschen.<br><br>In der Zwischenzeit kann mit WODA schon ein Dashboard zusammengeklickt werden, das beim umschalten nicht nochmal angefasst werden muss. | Für die Bauabteilung ist ein einfaches, für die Fachabteilung angepasstes, Dashboard besser als in den IT Werkzeugen von SAP arbeiten zu müssen. | Einsparungen in Zeit, Komplexität, Kosten<br><br>Sofortige Iterationen neuer Lösungen<br><br>Ad hoc Prototypen bauen<br><br>IT kann im Hintergrund weiterarbeiten während die Fachabteilung die Lösung schon nutzen kann |
| 3   | Besser digitale Werkzeuge nutzen, als Kollegen per Telefon anrufen zu müssen, um an die notwendigen Informationen zu kommen. | Einfache Web Apps, auf die alle in der MPG zugreifen können | Personen sind nicht immer gut erreichbar und wir wären gerne personenunabhängig digital. | Selbstbedienung und bessere Effizienz |
| 4   | Einfach Daten filtern aus vielen Datenquellen ohne, dass ich mich darum kümmern muss woher die Daten kommen. | Echtzeit Zugriff auf aggregierte Daten unterschiedlichster Quellen mit sofortiger Aktualisierung in der Web App.  <br>Die Daten werden als “Universale Fachliche Objekte” in der Web App per Drag and Drop teilbar und verschiebbar.<br><br>Daten sind nur solange sichtbar in einem Kontext wie es in der Fachabteilung gebraucht wird. Daten werden nicht zwischengespeichert, sondern in Echtzeit aggregiert und verschwinden nach der Anzeige wieder. | Heute können die Daten nur in den IT Systemen pro Datenquelle angezeigt und gefiltert werden oder es muss in SAP BW zusammenkopiert werden. Das ist meist wegen der vielen sensiblen Daten nicht erwünscht. | Die Relevanz der Information ist erhöht, womit man schneller Entscheidungen auf aktuellerer Datenlage treffen kann. |
| 5   | Wir wollen uns mit unseren Standard MPG Login Daten anmelden und uns nicht noch mit anderen Logins oder Technologien anmelden müssen.<br><br>Keine neuen Passwörter, keinen neuen Anmeldebildschirme | Unser Open Source Anmelde Proxy kann sich in die Enterprise Single Sign On Kette hinzuschalten, so dass keine weiteren Eingaben seitens der Fachabteilung notwendig sind. | Wir loggen uns ein und benötigen daraufhin keine weitere Passwort -Bestätigung um mit den MPG System zu arbeiten.  <br>Dennoch fügen einige Systeme immer wieder Passwortabfragen hinzu, so dass wir uns nicht nur einmal einloggen müssen. | DSGVO- und Unternehmens-Richtlininen werden eingehalten.<br><br>WODA fügt keine zusätzliches Login hinzu und nutzt das MPG Single Sign On. |
| 6   | Einfache und schnelle Navigation zur Datenanalyse | Die Navigations- und Filterelemente reagieren direkt auf die “Universalen Fachlichen Objekte”. Dadurch lassen sich einfach schöne fachliche Anwendungsfälle mit natürlichem Benutzerverhalten umsetzen. | Derzeit müssen unsere Suchanfragen von IT Spezialisten in der SAP Hana Umgebung vorbereitet werden, anstelle sie einfach direkt in ein MPG benutzerorientiertes Werkzeug zu tippen. | Zeitersparnis durch weniger Warten auf interne IT Prozesse und mehr Zeit um effektiv zu arbeiten.<br><br>An der Fachabteilung orientierte Arbeitsabläufe in sehr kurzer Zeit umsetzen. |
| 7   | Grafische visuelle Navigation zu spezifischen Informationen. Zusammen mit geo-basierten Karten. | Allgemein zugängliche Open Source Software kann in Sekunden vom Anwender per Drag & Drop in die Web Anwendung gezogen werden und funktioniert sofort….ohne Installation, ohne IT Prozesse, ohne jemand Fragen zu müssen, ohne etwas Gefährden zu können.<br><br>Konkret zum Beispiel die Leaflet Open Street Maps als kostenlose Alternative zum Google Maps Kartenmaterial. | Momentan zeichnet eine Web Agentur Bilder für die Navigation aus der Deutschland Übersicht in die Bundesländer und die Standorte mit schönen grünen Punkten per Hand. Mit jedem neuen Institut, muss das Bild von Hand angepasst werden. | Die Karte zeigt immer aktuelle Geodaten und mit den Open Source Overlays können die Bundesländer, und Stadtgrenzen und Standorte einfach per drag & drop hinzugefügt werden.<br><br>Alles echte öffentliche Live Daten ohne manuelle Aufwände und externe Kosten. |
| 8   | Schnelle Realisierungszeit von Idee zur fertigen Web Anwendung | - Hersteller-, Browser- und Geräte unabhängige wiederverwendbare Software die nur einmal programmiert wird und dann überall ausgeführt werden kann.<br>- Eine Software Quelle für Mobile, Desktop and Enterprise Servers | Wir müssen bei der MPG standard Softwareprodukte vom Markt kaufen, die aber nur sehr begrenzt unsere fachlichen Prozesse unterstützen. Dies ist nur über langwierige Auschreibungen in ganz Europa möglich. Bis wir da einen fachlichen Ablauf unterstützt bekommen müssen wir so lange warten, dass er bis dahin nicht mehr relevant ist. | Schnelles Ergebnisse ermöglichen neue Arbeitsweisen und Fokussierung auf die “eigentliche” Arbeit. Bereitstellung von nicht veralteten Informationen zum richtigen Zeitpunkt. |
| 9   | Einfache und schnelle Änderungen der Software | Es sind viele Standard Open Source Komponenten bereits verfügbar um einfach per Drag & Drop auszuprobieren, wie eine Arbeitsablauf verbessert werden kann. | Realisierung von Dashboards zur Flächenanalyse in Archibus wurden eingestellt weil zu teuer und zu kompliziert. | Keine “Hemmungen” bei Anpassungen oder Überarbeitungen<br><br>Nachdem es der Anwender ausprobiert hat, kann es genau so sofort von einem Programmierer gemacht werden ohne, dass es noch weitere Analysen und Designs braucht. |
| 10  | Schnelle Antwortzeiten des Herstellers bei Änderungswünschen | Die Hersteller liefern eine Web Anwendung zur live Zusammenarbeit in der alle Termine, Protokolle, Dokumentationen und Anforderungs- und Umsetzungsprozesse miteinander gemacht werden können. Es ist bereits erprobt, dass MPG Mitarbeiter diese nutzen können, da sie darauf zugreifen können.<br><br>(e.g. Atlassian Confluence…) | Die Arbeitskultur in der MPG ist oft noch von Email Versand geprägt und so schickt man sich Dokumente mit kleinen Änderungen immer wieder ganz hin und her. Die aktuellen Versionen zu finden und im Überblick zu halten wird dann immer schwieriger. | Gut strukturierte Live-Protokolle mit leicht zu findender Historie spart Bearbeitungs-und Recherchezeit.  <br>Man behält stets die Übersicht. |
| 11  | Einfache Verfügbarkeit der Web Anwendungen. | Einfache minimale Deployment Anforderungen.  <br>Läuft auf allen kleinen Servern. | Wir müssen monatelang auf neue Infrastruktur und Applikationen warten. | Kein zusätzlicher Aufwand für die IT Abteilung |

## Action items

- [ ] provide German translation of USP table to MPG → Cerulean
- [ ] perform a MPG internal meeting on 15th of November → MPG
- [ ] MPG will provide results to Cerulean in order to answer and comment → Pascal

## Decisions

- MPG meeting will be used to evaluate Woda USPs

### Email Correspondence

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

tbd

tbd