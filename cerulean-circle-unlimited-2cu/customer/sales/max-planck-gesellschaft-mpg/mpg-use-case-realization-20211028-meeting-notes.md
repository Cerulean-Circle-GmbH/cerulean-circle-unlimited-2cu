[📁 Max Planck Gesellschaft Mpg](../max-planck-gesellschaft-mpg.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/500000018/mpg-use-case-realization-20211028-meeting-notes.md) | [🌐 Page Structure local SymLink](./mpg-use-case-realization-20211028-meeting-notes.page.md)

# MPG Use Case Realization - 20211028 Meeting notes

## Date

28 Oct 2021

## Participants

[Pascal Boullie <pascal.boullie@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) , Tel: 0151 46114243, Abteilung III

[Thomas Hucke <thomas.hucke@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) +49 89 1208-1463, SAP Experte

[Carmen Pantle <carmen.pantle@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) +49 89 1208-1572, Project Manager for IT

### Session Hosts

Marcel Donges, Andre Marquis

## Goals

Use case presentation for IT and next steps

## Discussion topics

| Time | Topic | Notes |
| --- | --- | --- |
| 15 min | Use Case Demo | - Presentation of demo use cases |
| 30 min | USPs | - Explanation and discussion of unique selling propositions |
| 30 min | WODA | - Presentation of WODA and its structure |
| 15 min | Next steps | - Discussion on how to proceed in order to have use cases running inside MPG |

### Use Case Demo

- [https://woda.q-nnect.com/EAMD.ucp/Components/de/mpg/MpgDashboard/4.3.0/src/html/dashboard.html](https://woda.q-nnect.com/EAMD.ucp/Components/de/mpg/MpgDashboard/4.3.0/src/html/dashboard.html)
- [https://woda.q-nnect.com/woda](https://woda.q-nnect.com/woda)
- [Q-nnect Server: Q-World login page](https://qworld-woda.q-nnect.com/)

### WODA and Q-nnect as Unique Selling Propositions (USP)

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

| **Customer need** | **Feature USP** | **Example** | **Benefit** |
| --- | --- | --- | --- |
| access multiple data sources in one place | Q-nnect Excel Mock up for SAP System<br><br>alternative direct SAP Hana Rest API access | custom web-based Dashboard on top of data management | Save time, effort and cost to collect relevant information |
| use digital tooling instead of calling colleagues | web-based apps | asking a colleague at some other location for the amount of open positions (vacancies) | self service and efficiency |
| quickly and easily filter the accumulated data | real time data access and visual update in graphical displays on connected universal business objects | currently data can only be filtered in each of the separate data sources, but a combined filtering is not possible today | information relevance is increased  <br>better informed decisions can be made in less time |
| use the given corporate access rights without any additional hassle  <br>no extra passwords, no additional logging screens | standard open source single sign on proxy server | we login and do not need any passwords after this to access MPG systems | security is uphold with the predefined DSGVO and corporate standards |
| easy and fast navigation and search in data | reactive connections between graphical navigation and display components | normally we have to prepare our searches from IT specialists in our SAP Hana environment instead of just typing them in a MPG user centric tool | less time to wait on internal IT processes and more time to effectively work |
| graphically drill down into detailed information especially with the geo data | open source live map component can be dragged and dropped into the environment and show geo data overlays in real time | on the MPG main web site a web agency draws pictures for germany and the german countries with their institute locations picture by picture. | less cost for external partners, faster time to market and live views on the current data situation |
| faster time from whish to usable tool | - Vendor, Browser and Device independent reusable software written once deployable anywhere<br>- Single source for Mobile, Desktop and Enterprise Servers | we have to buy standard products from the market that only cover parts of our needs and we always have to wait for european tenders  <br>effective improvements of our workflow are most of the time out of scope | fast visual feedback and iteration of better ways to work<br><br>focus on the real workflow topics and not on specifying something which is outdated when delivered |
| enable changes in reasonable time | big amount of standard open source components that can be recombined via drag & drop visually | We asked Archibus to add a dashboard tab for us and we are now waiting since more than 2 years | effective fast work improvements |
| fast response times of the tooling partners | self service collaboration environment accessible also for MPG (e.g. Atlassian Confluence…) | we normally communicate only via email with our partners and have trouble to find all emails and contextes after some time | live meeting notes and easy to find history saves time and keeps everything in one place |
| easy access within the MPG | simple minimal deployment requirements on any kind of small server | we wait for months for infrastructure for new tools | no additional efforts for IT |

#### German Translation

[https://2cu.atlassian.net/wiki/spaces/CCU/pages/1713012762/MPG+Use+Case+Realization+-+20211105+Meeting+notes#German-USP-Table](https://2cu.atlassian.net/wiki/spaces/CCU/pages/1713012762/MPG+Use+Case+Realization+-+20211105+Meeting+notes#German-USP-Table)

### Presentation of WODA and its Structure

Q/A about the most important topics which still needs to be understood about WODA by the current participants.

## Insights

Alternatives MPG evaluate because licenses already exist in house:

- Sharepoint
- PowerBI
- SAP Hana

Earliest next process step MPG employees foresee is in about 12 weeks

**WODA is not a Dashboard or Reporting Solution** which can be compared to Sharepoint or PowerBI**.**

**It is an enterprise software that enables fast custom application development and rollout to address specific working needs of specialized employees** (like the real estate and construction department)**.**

### Next Steps

- Are there any examples from the past, where MPG could start a project without the need for an European Tender?
- How did they proof their USPs?
  - What is the process and are there templates
- Whom did they have to proof it?

## Action items

- [ ] Meeting with decision makers; asap better earlier than Dezember @MPG
- [ ] send USPs to MPG @Cerulean
- [ ] reach out to Advanced Analytics Arbeitsgruppe @Pascal
- [ ] Access to Cerulean Coworking Site and documentation for self service on Documentation and Q&A @MPG

## Decisions

- UC are well done and accepted for approval
