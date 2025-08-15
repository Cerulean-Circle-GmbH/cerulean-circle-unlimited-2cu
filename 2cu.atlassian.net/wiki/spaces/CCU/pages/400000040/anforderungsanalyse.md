[📁 Sfs It Developement GitHub](/cerulean-circle-unlimited-2cu/product/development/2cu-custom-development/sfs-it-developement.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/2cu-custom-development/sfs-it-developement/anforderungsanalyse.md) | [🌐 Index Structure local SymLink](./anforderungsanalyse.entry.md)

# Anforderungsanalyse

Email vom 10.03.21 zwischen Rudolf Schmidt und Till Ruda

## Bezogen auf Adrian\_Edition\_new 20200909\_QD\_Modell\_TR\_v16\_Mär 2021.xlsx

- Auf Folie 2 werden Daten abgefragt zu

Geografische Ausrichtung (M)

Zielländer / Regionen

Wie sollen diese Daten eingetragen werden? Sollen zwei Felder existieren, ein Feld für Zielland und ein Feld Region, sollen diese Felder leere String Felder sein oder gibt es vordefinierte Werte, aus denen man auswählen kann?

**Hier geht es darum, dass ein Fonds normal auf Länder oder Regionen spezialisiert ist. Wir beispielsweise vergeben nur Darlehen Nach Deutschland, Österreich und die Niederlande, nicht aber in die Schweiz. Somit sollte eine Kreditanfrage auch das Thema Land prüfen.** 

**Normal würde ich hier eine manuelle Eingabe bauen. Diese kann später ja mittels Suche Vorschläge liefern. Alle Städte der EU samt Land, PLZ und Bundesland (sofern vorhanden) habe ich selbst in einer meiner Datenbanken hinterlegt bzw. kann auch  kurzfristig durch Adrian oder mich besorgt werden.**

- Wie würde aus deiner Sicht Kreditnehmer fachlich korrekt auf Englisch heißen? Debitor? Wichtig für konsistente Variablennamen und Architektur.

**Entweder Borrower, Beneficary, Debitor geht aber auch. Da die erste Version aber durch uns verwendet wird, kannst du bei solchen Themen auch gerne mit Deutschen begriffen arbeiten und es Kreditnehmer nennen.**

- Auf Folie 2 gibt es ein Feld Reporting turns (A)  
Was genau ist das, was wird dort beschrieben und welche Daten werden dort dargestellt und von wo kommen sie. Das Feld soll ja automatisch vorgegeben werden. Wie wird dieser Wert berechnet?

**Hier musst festgelegt werden**

1. **Wann muss dem Anleger „reportet“ werden (Monatlich, Quartal, Halbjährlich, Jährlich)**
2. **Was muss dem Anleger „reportet werden.**
  1. **NAV (Nettoinventarwert)**
  2. **GAV (Bruttoinventarwert)**
  3. **Andere KPI (Key performance indikators) siehe Seite 10**

**Wichtig ist hier zu verstehen, dass diese Informationen später automatisch erstellt werden sollen und dem Anleger dann immer zum Abruf bereitgestellt werden sollen in einem standardisiertem Reportingpaper**

- Auf Folie 4 steht "Zinssatz (D)". Welche Dropdown-Felder sollen dazu angeboten werden?

**Den Zinssatz (D) definiert der „Mieter“ der Software, also zu Beginn, wir als SFS auf Ebene 1 in den Rahmenbedingungen. Hier muss erfasst werden….**

**Typ Kredit bei Zinssatz von bis**

**Mezzanine  von 8% bis 12%**

**Real Equity von 18% bis 20%**

- Auf Folie 4 steht "Übersicht (A)". Nach welchen Kriterien werden die Werte automatisch ausgewählt?

**Auf Ebene 1 wird festgelegt**

**ob eine Abschlussgebühr/ Treuhandvergütung/ Anlageberaterfee anfällt und in welcher Höhe.**

**Siehe auch xls. Mappe Annahmen.**

**Wichtig ist hier auch zu wissen, dass die Abschlussgebühr, die durch den Kreditnehmer zu Zahlen ist, entweder direkt in die P&L**

**der SFS/Des Mieters**

                **des Anlegers**

                **beider, jeweils aufgeteilt**

**gebucht wird.**

**Folglich muss auf Ebene 1 bei Kosten eine Zuordnung möglich sein, wie sich die Einnahmen aber auch die Kosten verhalten.**

**Sprich, wir geben ein Darlehen raus. Zusätzlich zu dem Darlehenszins als Einnahmen entstehen noch die folgenden weitern Einnahmen (einige einmalig, einige wiederkehrend)**

**Abschlussgebühr (Einmalig)**

**Treuhandvergütung (Wiederkehrend)**

**Hier sollte dann noch das Thema P&L anzugeben sein mittels DropDown. Sofern anteilig ausgewählt wird, sollte zwei vorher „eingegraute“ oder transparente Felder auftauchen wo Manuell eine Aufteilung (beispielsweise 50%/50%) eingegeben werden muss.. klar ist, dass beide Felder in Summe nicht größer 100% sein würden 😉**

**Siehe u.a. auch Annahmen, B71… hier wird das auch angegeben und später dann durch Fonds I sowie P&L Fonds sowie Investoren (was die P&L des Mieters/SFS RE ist)**

- Auf Folie 5 wird die Prozesskette dargestellt. Wie soll sie in der Webapp abgebildet werden? Reicht eine einfache Tabelle aus? Soll die Abbildung grafisch oder als Formular abgebildet werden? Eine andere Frage. Soll zu dieser Abbildung auf der gleichen Seite Werte eingetragen werden können, wie z.B. der Ausfallwert? Wenn ja welche Werte sollen auch editierbar sein. Gesamtsumme? Oder werden die woanders eingegeben und wenn ja wo genau.

**Die Prozesskette muss gar nicht dargestellt werden. Die dient nur um dir die Rechenlogik der Work-Out-Quote zu veranschaulichen. Ich dachte mir, Bilder sind ab und an doch leichter zu verdauen als nackte Formeln.**

**Ich hätte auch sagen können:**

**Work-Out von 4% bedeutet bei einem Volumen von EUR 250 Mio.**

**Ausfall gesamt: EUR 10 Mio.**

**Ausfall pro Jahr: EUR 10 Mio. / 7 Jahre = EUR 1.43 Mio. bzw. 0,571% geplanter Ausfall pro Jahr**

**Jahr 1 verläuft ohne Ausfall, ergo: Maximaler Ausfall: EUR 8.571 Mio. (10 – 1,43) bzw. 3,43% ( 250/8,571)**

**Das ist für das Reporting der Anleger ein relevanter KPI, da so die reale Performance mit der geplanten verglichen werden kann**

- Auf Folie 8 soll die Tabelle aus Excel Datei "P&L Fonds" dargestellt werden. Da die Tabelle sehr komplex ist, bräuchte ich dazu mehr Hilfe wie genau die Tabelle dargestellt werden soll und was dargestellt werden soll. Soll es eine Export Funktion geben, damit die Daten aus der Webapp nach Excel überführt werden können sollen, evtl. damit sie als PDF ausgedruckt werden können. Was denkst du dazu?

**Darstellungsform bitte erstmal so übernehmen, wie wir sie gebaut haben. Dieses reicht für einen Mezz-Fonds für die Alphaversion auf aus.**

**Sprich, in die P&L gehört alles rein ab Zeile 10 bis nach unten.**

**Alles zwischen A1 bis M8 dient zur Ermittlung der IRR, was die wichtigste Kennzahl ist. Diese Berechnung sollte gesondert erfolgen. Sofern du zur Berechnung selbst Fragen hast, wende dich auch sehr gerne zusätzlich an Andrian**

**Export nach Excel, gerne**

**Export als PDF, gerne**

- Ist Tabelle "ExecSum" die Folie10?

**Genau, es ist der Anfang für Folie 10. Diese gliedern wir auf jeden Fall noch weiter auf, sie reicht aber erstmal für die Alphaversion…**

**Zur Folie 10**

**Punkt 1 bis 6 fällt in die Rubrik Reporting, nicht KPI**

**Punkt 7 bis 9 fällt in die Rubrik ist KPI**

**Wenn dann noch Zeit ist, können gerne noch KPIs wie**

**Ø Kredithöhe pro Kredittyp, Kreditnehmertyp**

**Ø Zins pro Kredittyp, Kreditnehmertyp**

**Ø Laufzeit pro Kredittyp, Kreditnehmertyp**

**IRR Aktuell (Startjahr bis jetzt)**

**IRR Plan zu Ist**

**Also KPI sind ja zum Glück nur Werte die durch das Bilden von Mittelwerten bzw. Summierungen etc. auf Basis der P&L entstehen. Sowas gesondert berechnen zu lasse sollte ja später noch nachgebaut werden können.**

**Dieses liefern wir gerne noch nach.**
