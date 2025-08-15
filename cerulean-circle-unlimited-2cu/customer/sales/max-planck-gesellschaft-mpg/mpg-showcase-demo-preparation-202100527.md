[📁 Max Planck Gesellschaft Mpg](../max-planck-gesellschaft-mpg.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/500000012/mpg-showcase-demo-preparation-202100527.md) | [🌐 Page Structure local SymLink](./mpg-showcase-demo-preparation-202100527.page.md)

# MPG Showcase Demo Preparation - 202100527

## Guests

[Pascal Boullie <pascal.boullie@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) , Tel: 0151 46114243

Date: 27.05.2021 14:00-15:00

Subject: Sync meeting in order to agree on next steps

### Session Hosts

Marcel Donges, Andre Marquis

## Goal

Communicate and agree on 1st use case candidate

## Agenda

- Present realization ideas and ask questions
- Discuss ideas
- Agree on next steps

## Insights

### Proposed use cases

see [MPG Showcase Demo Preparation - 202100520](../max-planck-gesellschaft-mpg/mpg-showcase-demo-preparation-202100520.md)

### Questions

- Origin of ‘Standorte Tab’ in ‘Excel Listung’?
  - created with excel Pivot view? or SAP export? or manual?
    - Standorte Tab is manuallly crafted
    - MPI Tab F, S… is manuallly crafted
- Wimi Datenbank (Abt V) missing because of GDPR?
  - Wimi → Wissenschaftliche Mitglieder
  - will be deliverd from Pascal → DONE ![(wink)](https://2cu.atlassian.net/wiki/s/1732347312/6452/9ec310e9ed617fde640b4372fb0e11f5501675fa/_/images/icons/emoticons/wink.png)

#### Description of the Data from Pascal

…anbei die sog. WiMi-Datenbank als anonymisierte und gekürzte Version. Wenn das System irgendwann zum „fliegen“ kommen sollte, dann wird neben dem SAP-Kürzel noch der „Bedarfsfaktor“ m.E. ein wesentliches Identifikationsmerkmal. Dieser wird einer Abteilung bzw. Nutzungseinheit zugeordnet und somit lassen sich die bereitgestellten Ressourcen zu dieser Einheit monitoren. Somit kann hier identifiziert werden, welche Ressourcen gebunden sind und welche zu bestimmten Zeitpunkten frei werden.

Im ersten Schritt: Mit dieser Tabelle sollte sich der Dummy zu den Vakanzen und Abteilungen erstellen lassen.

### Further information

- PPT page 2 is an Archibus proposal, page 3 is starting point is page 3
- PPT could be interpreted as a MVP and will be a 1st release candidate
- Excel GdB → yellow indicates information, that can be used to build Widget ‘Protfolio Baumaßnahmen’
- SAP-Kürzel is a primary key
- Standort and Campus do not have unique identifier keys
- Missing information → Sonderbereiche

### Next steps

- use case 1 to 3 will be realized in this sequence
  - use case 1 will be realized with a data source adapter, so in the future, only this adapter has to be replaced in order to consume live data
- Clarify security aspects with MPG IT

## Feedback

- Preparation is well done ![(wink)](https://2cu.atlassian.net/wiki/s/1732347312/6452/9ec310e9ed617fde640b4372fb0e11f5501675fa/_/images/icons/emoticons/wink.png)
