[📁 Max Planck Gesellschaft Mpg GitHub](/cerulean-circle-unlimited-2cu/customer/sales/max-planck-gesellschaft-mpg.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/customer/sales/max-planck-gesellschaft-mpg/mpg-rckfragen-20210427.md) | [🌐 Index Structure local SymLink](./mpg-rckfragen-20210427.entry.md)

# MPG Rückfragen - 20210427

## From MPG

Lieber Andre,

wir würden gerne eine weiteren Termin mit euch machen. Allerdings hat das einige Rahmenbedingungen, die für euch nicht ganz einfach sind.

Folgende Punkte sollen besprochen und im Anschluss bearbeitet werden:

1. `Klärendes technisches Gespräch:`  
Wir stellen ein paar (aber nicht abschließende) Fragen zusammen.
2. `Prototypisch einige wenige Auswertungen gemäß unserer Anforderungen von „woda“ realisieren lassen:`  
Die prototypische Auswertung würde im Anschluss an das Gespräch erstellt werden. Der Use Case würde von uns kommen. Ziel sollte sein, dass wir besser beurteilen können, wie einfach eure Berichte realisiert werden können.
3. `idealerweise das Ganze kostenfrei:`  
Wenn nicht kostenfrei, dann müssen wir ausschreiben mit allen Konsequenzen.

Kannst du mir eine Rückmeldung geben, ob das für euch leistbar/machbar wäre?

Velen Dank und herzliche Grüße

Angelika

## To MPG

Liebes MPG Team,

wir freuen uns über die Chance auf einen weiteren Termin mit Ihnen.

Wir bitten sie zu verstehen, dass die teuerste Ressource in einem Startup “Zeit” ist, daher wird ganz kostenfrei wahrscheinlich sehr schwierig. Dennoch helfen wir gerne bei der Evaluierung in einem Budgetrahmen, der unterhalb der Grenze liegt zu dem man Ausschreiben muss. Da WODA sehr einfach in eine Unternehmensstruktur integrierbar ist, sollte es auch nur einen geringen Aufwand für beide Seiten darstellen. Unser nächster Termin verursacht selbstverständlich keine Kosten, genauso wie die Antworten auf ihre bisherigen Fragen.

Nur um das kurz zu betonen. WODA ist kein klassisches Berichtstool, sondern eine Entwicklungsumgebung zur Integration oder Erweiterung bestehender und neuer Web-, mobilen, oder Desktop Anwendungen. Das war der initiale Use Case um den wir uns beworben haben um im Rahmen Archibus mehr Informationen darzustellen und zu verarbeiten. Nichts desto trotz ist WODA hervorragend geeignet einen Drag & Drop Reportgenerator für User zu bauen der sehr einfach zu benutzen ist, ohne auf komplexe Unternehmensdatenanbindungen zu verzichten.

Im Anhang finden sie schon einmal erste Antworten, die wir gerne im Termin weiter Erörtern und gerne auch in einem kleinen Vorortprojekt mit Ihnen evaluieren.

  
Bitte nennen Sie uns die Budgetgrenze ab der ausgeschrieben werden muss 

und für Sie mögliche Termine.

  
Wir sind gespannt auf Ihre Vorschläge.  
  
Beste Grüße,

Marcel Donges

(CEO Cerulean Circle GmbH)

PS: Nachfolgend die Antworten zu den Eingangsfragen:

### `Wo gibt es Restriktionen?`

Zur Zeit wird in JavaScript programmiert.  
Systeme können nur angebunden werden, wenn die notwendigen Zugangsdaten zur Verfügung stehen.

### `Wie bindet man SAP Systeme an? Wie werden dabei SAP-seitige Berechtigungen berücksichtigt?`

Wir haben einen SAP Connector im Portfolio, den WODA transparent nutzt. Der Connector kommt von der Firma Q-nnect und wurde bei der SAP hausintern entwickelt. Beide Produkte Q-nnect und WODA sind perfekt aufeinander abgestimmt. Es müssen keine SAP Adapter geschrieben werden. Alle Fachobjekte werden aus dem SAP System dynamisch in Echtzeit ausgelesen und mit den bestehenden SAP Benutzerrechten verwaltet. D.h. es ist Null Aufwand nötig um sofort SAP Daten in WODA anzuzeigen und zu verwalten.

Schulungsvideo Q-nnect

/Users/Shared/box.CeruleanCircle.com/CeruleanCircle GmbH/Partners/Q-nnect/Training/Screen Recording 2020-05-19 at 13.21.46.mov

`Wie organisiert die Software die APIs, die genutzt werden können (wie frägt sie die APIs ab)?`

WODA Komponenten beschreiben sich maschienenlesbar vollständig, d.h. jede Komponente stellt ihre APIs öffentlich in einem Repository zur Verfügung. Der WODA Autodiscovery-Mechanismus garantiert, dass Komponenten die miteinander reden können sich auch finden können.

`Welchen Vorteil haben wir mit der SW gegenüber einem klassischem BW System?`

WODA ist das erste “Web System” mit Domain-Oriented Business Objects und ist speziell auf Enterprise Governance (durch EAM) ausgelegt. Wichtigster Vorteil ist, dass die Fachobjekte durch ONCE zentral aus den Backend Systemen zusammengeführt werden können und dann verteilt sogar über Webseiten und Unternehmensgrenzen hinweg auf beliebigen Endgeräten in Apps zur Verfügung gestellt werden können. Dabei wird der Code nur einmal geschrieben und läuft überall.

`Wo werden die Daten gehalten?`

Die Daten bleiben wo sie herkommen. Keine Daten werden dupliziert, sondern mit den Unternehmensrechten aus den Erzeugungssystemen geladen, verarbeitet und zurückgeschrieben. Des Weiteren kann ONCE auch eigene neue Datenbanken verwalten.

`Wie werden neue Produkte / Datenbanken / Plattformen in der SW hinzugefügt und durch wen?`

Systeme werden per APIs angebunden (Service Orientiert) und können mit verschiedenen Autodiscovery Mechanismen für Developer oder gar User dynamisch hinzugefügt werden. Systeme können nur angebunden werden, wenn die notwendigen Zugangsdaten zur Verfügung stehen, oder das System ein offenes System ist.

`Wie kann der Enduser das Produkt zusammenstellen / Berichte konfigurieren?`

WODA ermöglicht es per Drag & Drop zu “programmieren”. D.h. ein Entwickler kann reporting Komponenten bauen, die sogar von Laien Benutzern per Drag & Drop zu eigenen Zusammenstellungen kompositioniert werden können. Für hoch spezielle Reports kann mit WODA sogar einfach ein Drag & Drop MPG Report Designer Tool entwickelt werden.
