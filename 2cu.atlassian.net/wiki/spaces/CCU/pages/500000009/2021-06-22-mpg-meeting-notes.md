[📁 Mpg Showcase Demo 202100622 GitHub](/cerulean-circle-unlimited-2cu/customer/sales/max-planck-gesellschaft-mpg/mpg-showcase-demo-202100622.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/customer/sales/max-planck-gesellschaft-mpg/mpg-showcase-demo-202100622/2021-06-22-mpg-meeting-notes.md) | [🌐 Index Structure local SymLink](./2021-06-22-mpg-meeting-notes.entry.md)

# 2021-06-22 MPG Meeting notes

## Date

22 Jun 2021

## Participants

[angelika.malinowski@gv.mpg.de <angelika.malinowski@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) Abteilungsleitung Abteilung III Forschungsbau und Infrastruktur

[Pascal Boullie <pascal.boullie@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) , Tel: 0151 46114243, Abteilung III

[Thomas Hucke <thomas.hucke@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) +49 89 1208-1463, SAP Experte

[Virginia Judy Kasten <virginia.kasten@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#), \[TBD\] → not in call

[Rudolf Oberholzner <rudolf.oberholzner@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#), Abteilung III

[Carmen Pantle <carmen.pantle@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) +49 89 1208-1572, IT Contact person for test server → not in call

[Alexander Seitz <alexander.seitz@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) 0049 171 5545932, IT Enterprise Architect

[Harald Suckfuell <harald.suckfuell@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#), IT Leiter

### Session Hosts

Marcel Donges, Andre Marquis

## Goals

Agree on first use case examples and start realization by using WODA

## Agenda

- Introduction (updated introduction of new people in the round, 10 min)
- answer questions (if there are any unanswered left) (10 min)
- Introduce use case candidates (30 min +15 min Q&A)
- Meeting actions (30 min)
- Next Steps (5 min)
- Feedback (5 min)

## Discussion topics

| Topic | Notes |
| --- | --- |
| answer questions | - Q: How does a secure SAP access look like with Woda?<br>  - Q-nnect demo incl. access details were shown<br>    - Mini demo on how example data will be transformed into domain objects<br><br>\=> add additional role ‘q-nnect’ user required<br><br>- Q: MPG access concept is transaction-based. I this an issue?  <br>\-> no issue, as all is a transaction => to be evaluated in UC 3<br>- Q: What is the benefit of this approach?<br>  - the advantage of web-based domain programming  <br>\-> independent from underlying technology<br>  - the consequent EAM structure conformity<br>  - Data are just cached (q-nnect reader), writing via (q-nnect writer)<br>- Q: How to access big data eg finance data performantly?  <br>\-> Data will be composed in real-time by lazy loading<br>- Q: What if there is no SAP view available?  <br>\-> As soon as the view is built, q-nnect can use it  <br>\-> Views can also be constructed on q-nnect level |
| introduce use case candidates | → *based on PPT 210331\_DATA\_III\_DASHBOARD.PPT and example data , provided by MPG*<br><br>- UC 1-2 consists of mini-report widgets (incl. navigation from world to country to region)  <br>\-> should also introduce infrastructure<br>- UC3 requires data access<br>  - a virtual root server (any Linux is ok) with admin access within MPG Test environment is required  <br>\-> an already used VM with appropriate rights would also do it!<br>  - Access rights will be the same as for normal users (SSO is possible, but must be realized in the real project)  <br>\-> SAP SSO how to? => clarification required  <br>\-> In principle, WODA supports all access strategies but must be tailored to the appropriate company demand |
| meeting actions | - Feedback to the Use Cases → DONE<br>- Understand the financials and frame for each of the Use Case realizations → DONE<br>- Defining the budget and scope for **an official PoC → DONE** |

## Action items

### MPG action items

- [ ] Drive the IT Infrastructure requirements in parallel
- [ ] SAP access => additional role ‘q-nnect’ user for SAP required
- [ ] SAP SSO how to? => clarification required
- [ ] WODA provisioning => virtual root server required
- [ ] \=> Mr. Suckfuell will figure out a creative and faster solution
- [ ] \=> SAP access effort for the next steps must be performed in parallel, starting right now
- [ ] \=> PoC will start with UC 1 + 2 and UC 3-2 will first use Archibus  
\=> An additional UC 3-3 will be realized after SAP access is given
- [ ] Budget clarification in JourFix, together with Mrs. Malinowski, later today (20210622)
- [ ] In order to ensure that customer demands are met, there must be reviews every 2 weeks after the start of development  
\- At least one IT / PO representant must participate, but everybody is welcome  
\- Pascal will organize these meetingsDecisions

### Cerulean action items

- [ ] Provide individual offers for UC 1- 3  
\=> UC 3-2 will use Archibus data  
\=>Evaluate if MPG SAP transaction-based access concept is an issue?  
\=> UC 3-3 is derived from UC 3-2 but will use SAP data

## Decisions

- \- MPG orders a proof of concept (PoC) consisting of UC 1-3  
\- UC 3-2 will first use Archibus data  
\- UC 3-3 will be the same, but using SAP data  
\- Demand will consist of 4 individual UC orders. Each for 2 days and 999,00EUR  
\- MPG will start providing system access and SAP data provisioning as soon as possible  
At latest, however, when order has been accepted by MPG  
  
\- Cerulean will provide UC1-3 within max. 8 weeks, after approval  
\- UC 3-3 will start after MGG provides SAP access
