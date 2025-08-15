[📁 Deloitte](../deloitte.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000120/rahmenbedingungen-woda-usecases.md) | [🌐 Page Structure local SymLink](./rahmenbedingungen-woda-usecases.page.md)

# Rahmenbedingungen WODA UseCases

- Technisch
  - Proof of Concept
- Business
  - Proof of Value
    - Potential aufzeigen für Verwendung im nächsten Kundenprojekt
    - muss Vorteile sichtbar machen, die mit WODA erzielt werden
      - Kosteneffizienz durch Wiederverwendung
- machbar in 4 Sprints
- Stakeholder die wir abholen müssen
- muss es abgeschlossen sein
- muss es ein eigner mini business case sein
- Potential aufzeigen für Verwendung im nächsten Kundenprojekt
- muss Vorteile sichtbar machen, die mit WODA erzielt werden
  - Kosteneffizienz
- simpler case
- Brücke in verschiedene Branchen

### Cases on the Table

- Versicherungs Case Telemetrie Daten Sharing

- e-Commerce Case
  - Domain Objekte und Data Binding und UX sauber kapseln und
  - special UX
  - Domain Objekte
  - Data Bindings
    - Binding allgemeingültig machen
  - Development Tools
    - Browserplugin
    - WODAFYing von APIs und bestehenden Komponenten in anderen Frameworks
    - UX zieht Domain Object dependencies als Interfaces mit
    - Domain Object Governance

- Partner Self Service Product Domain Object  [WODA-431](https://2cu.atlassian.net/browse/WODA-431?src=confmacro)
  - Domain Objects
    - Produkt und Service-Leistungsbausteine
      - SKU, Picture, Description,…
      - can be top down
        - ist aber schwieriger
    - Pricing
      - One Time Pricing
      - Recurring
        - Monthly
        - Quarterly
        - Yearly
      - Quantified
        - per CPU
        - per Project
        - per Account
    - Authentication Object
      - Security Context
      - must be bottom up because of existing standards
        - sind gesetzt! ist daher einfach
  - Data Binding
    - UX - API
      - WODA GUI
      - Angular
      - Vue
      - React
    - Backend Technology BINDING
      - API
        - REST
          - Structr
          - Q-nnect
        - GraphQL
        - SOAP
        - XML
      - Mindestens einen echten Provider auch anzubieten
        - Wie bei SIXT, Emmy, Uber
      - Data
        - DB
        - Document
        - Graph
