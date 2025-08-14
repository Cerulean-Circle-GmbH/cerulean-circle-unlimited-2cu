# NEOM Basics

- [NEOM Kickoff Agenda](./2cu.atlassian.net/wiki/spaces/CCU/pages/1852243973/NEOM_Kickoff_Agenda.md)
- [NEOM Kickoff-Planning](./2cu.atlassian.net/wiki/spaces/CCU/pages/1853194241/NEOM_Kickoff-Planning.md)
- [NEOM Glossary](./2cu.atlassian.net/wiki/spaces/CCU/pages/1859190851/NEOM_Glossary.md)

* * *

- [Project Members](#project-members)
- [Access](#access)
- [Core Documents](#core-documents)
- [Tools](#tools)
- [Products](#products)
  - [Methodology](#methodology)
- [Streams](#streams)
  - [Planning Stream](#planning-stream)
  - [Development Stream](#development-stream)
    - [CC Stream](#cc-stream)
    - [Cavrn.us Stream](#cavrnus-stream)
    - [DAL Stream](#dal-stream)
    - [nn Stream](#nn-stream)
  - [DevOps and QA Stream](#devops-and-qa-stream)
- [Definition of Done](#definition-of-done)
- [Artefacts Agreements](#artefacts-agreements)
- [Meeting Templates](#meeting-templates)
  - [Planning Meeting (Developers + Product Owners)](#planning-meeting-developers-product-owners)
  - [Daily (all)](#daily-all)
  - [QA Stream](#qa-stream)
- [Steering Document Links](#steering-document-links)
- [Example Project](#example-project)
- [People - important in the Project Scope](#people-important-in-the-project-scope)
- [Information from the NEOM Environment](#information-from-the-neom-environment)
- [Videos](#videos)

## Project Members

[NEOM PoC](../neom-poc.md)

## Access

[Click here for user's access overview](./2cu.atlassian.net/wiki/spaces/CCU/pages/1850671105/NEOM_PoC.md#Access)

1. Atlassian (you are here already)
2. 1blu server (ssh keys)
3. WhatsApp [https://chat.whatsapp.com/GPwVBuQ9R1x3zZFtikMpHg](https://chat.whatsapp.com/GPwVBuQ9R1x3zZFtikMpHg)
4. [Slack](https://join.slack.com/t/cerulean-circle/shared_invite/zt-1n53dxfwm-SGVrNwGuerMQiTAoJkI8sw)
5. [Google Calendar](./2cu.atlassian.net/wiki/spaces/CCU/pages/1853194241/NEOM_Kickoff-Planning.md#Team-Calendar-details)
6. [Videos](./2cu.atlassian.net/wiki/spaces/CCU/pages/1850867713/NEOM_Basics.md)

## Core Documents

- Scope of Work
  - [2cu IDEA independent Use Cases](./2cu.atlassian.net/wiki/spaces/CCU/pages/1851916351/2cu_IDEA_independent_Use_Cases.md)
    - Original read only Word [2cu IDEA independent Use Cases](https://1drv.ms/w/s!AtrdisPqy66rjSUWNsuAbqTSVL6n)
  - Excel Analytics of the Use Cases  
Original Excel [Dependency Matrix](https://1drv.ms/x/s!AtrdisPqy66rjTEV4y3of1FISJFw)
    - Google Sheet Links
      - [https://docs.google.com/spreadsheets/d/1T2cSe\_vexKPZS-GS0XnuwsnB5Ejl44jU/edit?usp=sharing&ouid=116092235506984381367&rtpof=true&sd=true](https://docs.google.com/spreadsheets/d/1T2cSe_vexKPZS-GS0XnuwsnB5Ejl44jU/edit?usp=sharing&ouid=116092235506984381367&rtpof=true&sd=true) Read Only
      - Architecture design[NEOM Customer Journey](https://miro.com/app/board/uXjVPwfzfQc=/?share_link_id=446320753070)
  - PPT Architektur
    - [https://1drv.ms/p/s!AtrdisPqy66rjS8Dvg9IPU0DZn9d](https://1drv.ms/p/s!AtrdisPqy66rjS8Dvg9IPU0DZn9d)
    - Sound Currency GUI Clickdummy  
[https://1drv.ms/p/s!AtrdisPqy66rjR-M8pE\_F1Db9kWS](https://1drv.ms/p/s!AtrdisPqy66rjR-M8pE_F1Db9kWS)
  - Jira Backlog
    - [https://2cu.atlassian.net/jira/software/c/projects/N1/boards/9](https://2cu.atlassian.net/jira/software/c/projects/N1/boards/9) Active Sprint
    - [https://2cu.atlassian.net/jira/software/c/projects/N1/boards/9/backlog?view=detail&selectedIssue=N1-2&issueLimit=100](https://2cu.atlassian.net/jira/software/c/projects/N1/boards/9/backlog?view=detail&selectedIssue=N1-2&issueLimit=100) Backlog
    - [https://bitbucket.org/donges/eamd.ucp/pull-requests/](https://bitbucket.org/donges/eamd.ucp/pull-requests/) Pull Requests
  - NEOM PoC Schedule: [https://docs.google.com/spreadsheets/d/10Hx28g3BHzMt2fjM1VBUPDN3msnXomJZ/edit?usp=sharing&ouid=116092235506984381367&rtpof=true&sd=true](https://docs.google.com/spreadsheets/d/10Hx28g3BHzMt2fjM1VBUPDN3msnXomJZ/edit?usp=sharing&ouid=116092235506984381367&rtpof=true&sd=true)

## Tools

- Confluence - all Team → Dierk
- Bitbucket - all Team → Matthias
- Jira- all Team → Dierk
- Mindmeister / Taskmeister - CC internal only → Marcel
- Onedrive - only particular documents → Marcel
- Google Drive - only particular documents → Dierk
- wsl / Docker → all → Matthias

## Products

- cavrn.us
- epic
- WODA Dev Environment All in One
  - [https://2cu.atlassian.net/wiki/spaces/CCU/pages/1867153409/Install+WODA+development+environment+using+Once2023+docker+image](https://2cu.atlassian.net/wiki/spaces/CCU/pages/1867153409/Install+WODA+development+environment+using+Once2023+docker+image)
    - [https://github.com/Cerulean-Circle-GmbH/WODA.2023](https://github.com/Cerulean-Circle-GmbH/WODA.2023)
    - [https://drive.google.com/file/d/1jUXsPgEfBI-UbGUkYWXDkZKDNJAyEZdZ/view?usp=share\_link](https://drive.google.com/file/d/1jUXsPgEfBI-UbGUkYWXDkZKDNJAyEZdZ/view?usp=share_link)
- Once Shell (included above)
  - [https://github.com/Cerulean-Circle-GmbH/once.sh](https://github.com/Cerulean-Circle-GmbH/once.sh)
  - [WODA Training](../../../development/woda/woda-training.md)

### Methodology

[https://dev.wo-da.de/RAW/CC Videos/NEOM/Meetings/Todays Daily (2023-01-17 11\_05 GMT+1).mp4](https://dev.wo-da.de/RAW/CC%20Videos/NEOM/Meetings/Todays%20Daily%20(2023-01-17%2011_05%20GMT+1).mp4)

[https://prezi.com/xerppb6bv1nh/?preview=1](https://prezi.com/xerppb6bv1nh/?preview=1)

## Streams

### Planning Stream

Philipp, [Ingo](./2cu.atlassian.net/wiki/spaces/CCU/pages/1850671105/NEOM_PoC.md#Ingo-Düppe), [Marcus](./2cu.atlassian.net/wiki/spaces/CCU/pages/1850671105/NEOM_PoC.md#Marcus-Nörder-Tuitje), Felix, Matthias, [Dierk](./2cu.atlassian.net/wiki/spaces/CCU/pages/1850671105/NEOM_PoC.md#Dierk Wiedemann), [Marcel](./2cu.atlassian.net/wiki/spaces/CCU/pages/1850671105/NEOM_PoC.md#Marcel-Donges)

### Development Stream

#### CC Stream

Max, Nico, Daniel

#### Cavrn.us Stream

Anthony, David, (Olivier, Jeff)

#### DAL Stream

[Herman](./2cu.atlassian.net/wiki/spaces/CCU/pages/1850671105/NEOM_PoC.md#Herman-Otto)

#### nn Stream

nn

### DevOps and QA Stream

Matthias, Dierk, Marcel

## Definition of Done

- [Definition of DONE](./2cu.atlassian.net/wiki/spaces/CCU/pages/119111681/Definition_of_DONE.md) This is the agreed DoD

## Artefacts Agreements

Product Backlog: [Marcel](./2cu.atlassian.net/wiki/spaces/CCU/pages/1850671105/NEOM_PoC.md#Marcel-Donges) and Planning Stream

Sprint Backlog: Dev Teams

Product Increment:

## Meeting Templates

### Planning Meeting (Developers + Product Owners)

**Goal**: Agreement on the sprint goal (deliverables), Sprint Backlog, MVP.

**Prerequisite**: PO has defined sprint goal (shortlist backlog items sorted by technical dependency), PO defines DoD, defined capacity of team.

**Execution**:

1. PO presents sprint goal and associated PBIs and answers the team's comprehension questions.
2. PBIs to be estimated after detailed discussion on implementation
3. team predicts to PO which PBIs can be delivered end of sprint according to the jointly written DoD.

**Outcome:**

1. sprint target incl. associated PBIs are defined
2. common understanding regarding the implementation of the PBIs due to discussions among the development team
3. a cleanly mapped Sprint Backlog, which maybe now contains "tasks" i.e. activities

**Documentation:**

1. the sprint goal is documented in the Sprint Backlog.
2. all PBIs (with tasks) should be listed on the Sprint Backlog - the order of the Product Backlog is adopted here.
3. it is clearly documented which PBIs the development team is committed to vs optional.

### Daily (all)

(!lateness, !monopolizing, !formalizing)

1. **Blockers** (Is there anything preventing contributions)  
technical limitations,  
departmental and team dependencies  
personal limitations (vacations booked, people out sick, etc.).
2. What did you do **yesterday**?This is a quick rundown of what got done yesterday (and if anything didn’t get done, then why).  
\- focus on the large chunks of work that made up their deep focus tim  
\- activities that are relevant to your team as a whole.
3. What are your goals for **today**?
4. How **close** are we to hitting our sprint goals? **comfort level**?

### QA Stream

Matthias, Marcel, Marcus

## Steering Document Links

[https://www.mindmeister.com/map/2547519953?t=FC1jEUnwpo](https://www.mindmeister.com/map/2547519953?t=FC1jEUnwpo)

[https://www.meistertask.com/projects/98xiitutns/join/](https://www.meistertask.com/projects/98xiitutns/join/)

[https://docs.google.com/spreadsheets/d/10Hx28g3BHzMt2fjM1VBUPDN3msnXomJZ/edit#gid=569811008](https://docs.google.com/spreadsheets/d/10Hx28g3BHzMt2fjM1VBUPDN3msnXomJZ/edit#gid=569811008)

## Example Project

[Hello Mirrors](../../../../../cerulean-circle-unlimited-2cu/customer/sales/hello-mirrors.md)

[BP Core Information Model (CorIM) Management](../../../../../cerulean-circle-unlimited-2cu/governance/eam/business-processes/bp-core-information-model-corim-management.md)

## People - important in the Project Scope

- [https://www.linkedin.com/in/mahmut-boz-705292](https://www.linkedin.com/in/mahmut-boz-705292)

## Information from the NEOM Environment

- [https://www.linkedin.com/posts/mansoor-hanif\_someone-re-created-the-known-universe-in-activity-7015512081038794753-WUPS?utm\_source=share&utm\_medium=member\_android](https://www.linkedin.com/posts/mansoor-hanif_someone-re-created-the-known-universe-in-activity-7015512081038794753-WUPS?utm_source=share&utm_medium=member_android)
- [https://www.linkedin.com/posts/mansoor-hanif\_neom-data-dataanalytics-activity-7018743325994225664-Hj1k?utm\_source=share&utm\_medium=member\_android](https://www.linkedin.com/posts/mansoor-hanif_neom-data-dataanalytics-activity-7018743325994225664-Hj1k?utm_source=share&utm_medium=member_android)
- [https://www.linkedin.com/feed/update/urn:li:activity:6998570292293812224?utm\_source=share&utm\_medium=member\_android](https://www.linkedin.com/feed/update/urn:li:activity:6998570292293812224?utm_source=share&utm_medium=member_android)
- [https://www.linkedin.com/posts/discoverneom\_neom-in-5-years-activity-6995398411369766913-k1zh?utm\_source=share&utm\_medium=member\_android](https://www.linkedin.com/posts/discoverneom_neom-in-5-years-activity-6995398411369766913-k1zh?utm_source=share&utm_medium=member_android)

## Videos

user: dev  
pw: secret

- [NEOM Videos](https://dev.wo-da.de/RAW/CC%20Videos/NEOM) (confidential)
- [Meeting Recordings](https://drive.google.com/drive/folders/1Pr9ID1Ba5KRXEUrkkEjKphiJImxRgZWp?usp=sharing) (tip: sort by last modified)