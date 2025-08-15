[📁 Max Planck Gesellschaft Mpg GitHub](/cerulean-circle-unlimited-2cu/customer/sales/max-planck-gesellschaft-mpg.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/customer/sales/max-planck-gesellschaft-mpg/mpg-showcase-demo-preparation-202100520.md) | [🌐 Index Structure local SymLink](./mpg-showcase-demo-preparation-202100520.entry.md)

# MPG Showcase Demo Preparation - 202100520

## Guests

[Pascal Boullie <pascal.boullie@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) , Tel: 0151 46114243

Date: 20.05.2021 14:00-15:00

Subject: Identification of showcase candidates

### Session Hosts

Marcel Donges, Andre Marquis

## Goal

Identification of the first couple of use case candidates

## Agenda

- Demo of possible use cases by Pascal
- Discussion
- Agree on next steps

## Insights

### MPG Data Sources / Systems

- Archibus (web-based) → Contains elementary institutional master data (e. g. MPG locations)
- Smart Project Manager (Cytrix based) → Accounts management
- D.3 (web-based) → Data Management System DMS containing running text documents
- MyFMBiz (web-based) → Operative things like DWG files -> will be migrated to a BIM system

### Requirements

**Vision**

Provide an overarching, aggregated easy to navigate view on data, coming from different MPG sources.  
Visualization similar to a dashboard with individual filtering capabilities and an option to export the results into a PDF document

**NFR requirements**

- easy usage of underlining MPG data (SAP, DMS, …)
- cool (intuitive, interactive) app navigation without the burden to authorize over and over again

* * *

### Business Use Cases

- **UC 1** Visualize elementary institutional master data on a geo map (Welt, Land, Bundesland, …)
  - aggregate and show pie carts in order to identify vacancy
  - by using Excel sample data  
- **UC 2** Navigate into and summary of detailed data from a dashboard view
  - by using MPG DMS data  
- **UC 3** Aggregate all ‘Status n’ projects regarding areas, costs, etc.  
(Status 0 - ready, 1- approved, …, 3- … , 6 - ideation)
  - by using MPG systems data

### **Use case candidates by technical complexity of preparation**

- **UC 1: Data Widgets for Dashboard**
  - Vacancy Pie Chart from Excel Data Export
- **UC 2: Comfortable Visual Navigation**
  - Drill Down navigation with Map (mock up)
- **UC 3: Enterprise Integration**
  - Access at least one real data source
    - 1: d3 Document Mgmt System
    - 2: Archibus data
    - 3: SAP

### Description of the Data from Pascal

… anbei übersende ich euch als Grundlage zur Erarbeitung der Anwendungsfälle für unsere WO-DA-Oberfläche 2 Listen mit den Stammdaten für die vakante/ besetzte Abteilungen und mit Maßnahmen aus SAP. Beide Listen können als download generiert werden, so dass zukünftig dann hier über direkte Systemanbindungen gesprochen werden muss (v.a. SAP).

Mit der SAP-Liste könnten die Diagramme für die Maßnahmen Status 5 bis 0 generiert werden. Mit der Liste der MPI könnten die Diagramme für die Vakanzen im Dummy erstellt werden. Ich habe die Listen anonymisiert und auf die notwendigen Informationen eingedampft. Wesentlich wird hier natürlich nicht das Auslesen von Tabellen, sondern die Anbindung an die Quelldatenbank, trotzdem könnte man hiermit für den anstehenden Termin konkret Funktionalitäten abbilden, so dass wir einen Schritt weiter in die Tiefe eines mgl. Projektes kommen könnten.

#### WiMi MPG Abteilungen

… anbei die sog. WiMi-Datenbank als anonymisiert und gekürzte Version. Wenn das System irgendwann zum „fliegen“ kommen sollte, dann wird neben dem SAP-Kürzel noch der „Bedarfsfaktor“ m.E. ein wesentliches Identifikationsmerkmal. Dieser wird einer Abteilung bzw. Nutzungseinheit zugeordnet und somit lassen sich die bereitgestellten Ressourcen zu dieser Einheit monitoren. Somit kann hier identifiziert werden, welche Ressourcen gebunden sind und welche zu bestimmten Zeitpunkten frei werden.

Im ersten Schritt: Mit dieser Tabelle sollte sich der Dummy zu den Vakanzen und Abteilungen erstellen lassen.

### Prerequisites

- SAP access  
\-> Q-NNECT System (for accessing SAP data) has to be installed  
\-> SAP user and access data are required

\=> appointment with **Mr. Seitz is required**

- a dedicated Root Server within the MPG environment is required.
- all necessary software will then be applied by running the WODA install script.

##### Update: Call with Mr. Seitz (20210608)

Topic Stakeholder

- SAP → Mr. Thomas Hucke, +49 89 1208-1463
- Non SAP → Mrs. Carmen Pantle, +49 89 1208-1572

\=> These Stakeholder has to be asked for access to DEMO systems

##### Update: Call with Mr. Hucke (20210617) => Telko (Marcel, Andre)

**Info**

- MPG As-is-situation: SAP BW 4 HANA Access via HANA Studio on a terminal server for MPG employees
- Older HUR component on SAP ERC level in a different data center
- SAP servers are in dedicated 3rd party data center, separated from own MPG servers

**Requirements**  
Testserver (->Referat 9A) in SAP Environment + Firewall access enablement  
\=> ‘Firewall Antrag’ for Poolfreischaltung (Q-NNECT protocol, ports required)

### Next steps

- Involve Angelika in order to get an appointment with IT department (Herr Seitz)→ Andre DONE
- Provide MPG PPT of this meeting, as well as some Excel, containing anonymized example data (Bundesland, Standorte)→ Pascal DONE
- Follow up meeting with Pascal Boullie next Thursday (20210527 14-15h) → all DONE
- Talk to Mr. Hucke → DONE
- Forward mail of Mr. Seitz to Mr. Hucke! → DONE

## Feedback

- Good meeting, as we now have a more concrete vision and action items
