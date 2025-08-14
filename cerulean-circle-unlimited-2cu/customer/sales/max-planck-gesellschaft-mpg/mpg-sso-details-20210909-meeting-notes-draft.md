# MPG SSO Details - 20210909 Meeting notes (draft)

## Date

09 Sep 2021

## Participants

[Pascal Boullie <pascal.boullie@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) , Tel: 0151 46114243, Abteilung III

[Thomas Hucke <thomas.hucke@gv.mpg.de>](https://ox.hosteurope.de/appsuite/#) +49 89 1208-1463, SAP Expert from IKT

[Martin Schultheiß <martin.schultheiss@gv.mpg.de>](mailto:martin.schultheiss@gv.mpg.de), Archibus Expert

[Christina Zepeck <christina.zepeck@gv.mpg.de>](mailto:christina.zepeck@gv.mpg.de), SSO expert

### Session Hosts

Marcel Donges, Andre Marquis

## Goals

SSO clarifications: Understand how to use MPG SSO

## Discussion topics

| Time | Topic | Notes |
| --- | --- | --- |
| 15 min | Short intro | - Demonstrate MPG SSO |
| 45 min | Tech details | - Discuss technical perspective and agree on access concept |

## Insights

WODA can use Keycloak Identity Management out of the box. Keycloak is an state of the art Red Heat Open Source Software.  
It that can be configured to delegate login to SAML 2.0 with a simple IDG config file:  

[Identity Provider](https://test.wo-da.de/auth/admin/master/console/#/realms/master/identity-provider-settings) / Add identity provider  
Import External IDP Config

## Action items

- [ ] Keycloak External IDP Config for simplSAML from MPG

## Decisions

### Email Correspondence
![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)
Zusammenfassung 3. Sept 2021
Mailauszug vom 02.09.21
## aus SSO Meeting
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