# Infrastructure Value Stream Overview

[Asset Übernahme von 2cu: Shift Projects](https://www.mindmeister.com/map/2139080018?t=FTZn6x3flE)

- [SFS-RE](#sfs-re)
  - [haparo → SFS-RE-IT](#haparo-sfs-re-it)
- [Shift](#shift)
- [WODA](#woda)
- [Server Information](#server-information)
  - [https://test.wo-da.de](#httpstestwo-dade)
  - [https://prod.wo-da.de](#httpsprodwo-dade)

## SFS-RE

[SFS-RE-IT](./infrastructure-value-stream-overview/sfs-re-it.md)

### haparo → SFS-RE-IT

```
# [VPS R48 ( Vertrag 309320 )](https://www.mindmeister.com/map/2147985175?t=FTZn6x3flE)

 - v35469.1blu.de
    - haparo.com
        - 178.254.33.66
            - übertragen an SFS-RE-IT
                - VPS R48 (24,90 € / Monat)
                    - *3 = 74,70
                        - Referenz NOTPROVIDED
                          Mandat 2748953
                          Einreicher-ID DE21ZZZ00000623592
                          122018960 / 2748953
```

## Shift

## WODA

```
# [1blu](https://www.mindmeister.com/map/2139092256?t=FTZn6x3flE)

 - Kundennummer
    - 2748953
        - Account
            - Marcel PoBa Konto
                - quartalsweise abrechnung
                    - *3
                - summe
                    - 907,80 €
            - Cerulean Circle GmbH
        - VPS R48
          ( Vertrag 309320 )
            - v35469.1blu.de
                - haparo.com
                    - 178.254.33.66
                        - kann gekündigt werden
                            - VPS R48 (24,90 € / Monat)
                                - *3 = 74,70
                                    - Referenz NOTPROVIDED
                                      Mandat 2748953
                                      Einreicher-ID DE21ZZZ00000623592
                                      122018960 / 2748953
        - VPS R24
          ( Vertrag 309717 )
            - v36421.1blu.de
                - test.wo-da.de
                    - 178.254.18.182
                        - wichtiger hauptserver
                            - VPS R24 (12,90 € / Monat)
                                - *3 = 38,70
                                    - Referenz NOTPROVIDED
                                      Mandat 2748953
                                      Einreicher-ID DE21ZZZ00000623592
                                      122050327 / 2748953
        - VPS R48
          ( Vertrag 316508 )
            - v60211.1blu.de
                - prod.wo-da.de
                    - 195.90.209.56
                        - wichtiger hauptserver
                            - VPS R48 (24,90 € / Monat)
                                - *3 = 74,70
                                    - Referenz NOTPROVIDED
                                      Mandat 2748953
                                      Einreicher-ID DE21ZZZ00000623592
                                      122018960 / 2748953
    - 2720979
        - 1blu-vServer 16R
          ( Vertrag 262499 )
            - Account
                - ZahlungsartSEPA-Lastschrift
                  Kontoinhaber *
                  Shift GmbH
                  IBAN *
                  DE****************9040
                  BankRaiffeisenbank Borken Nordhessen
                    - Plesk Web ADMIN Edition (10 Domains) (5,90 € / Monat)
                        - 5,90 € /
                          Monat
                            - seltsam Abbuchung von 6.1.
                                - über CC Konto
                                - ok shift konto wurde am 12.1. eingetragen
                    - 1blu-vServer 16R (16,90 € / Monat)
                        - 16,90 € / Monat
                - Cerulean Circle GmbH
            - v32109.1blu.de
                - dev.wo-da.de
                    - wichtiger hauptserver
                        - 1blu-vServer 16R (16,90 € / Monat)
        - 1blu Rechnungsadresse ändern
```

[Change Management WODA servers](./infrastructure-value-stream-overview/change-management-woda-servers.md)

[Test WODA Server Handover](../1795555329/Test_WODA_Server_Handover.md)

[Infrastructure Value Stream](../747372568/Infrastructure_Value_Stream.md)

## Server Information

### [https://test.wo-da.de](https://test.wo-da.de)

> [!CAUTION]
> WHERE are the Structr Schema Backup scripts (in jenkins)

- NEOM DEMO
  - [City Management App (test.wo-da.de)](https://test.wo-da.de:9543/EAMD.ucp/apps/neom/CityManagement.html)
  - [EAMD.ucp repository (test.wo-da.de)](https://test.wo-da.de:9543/EAMD.ucp/)
  - [Installation Status Log (test.wo-da.de)](https://test.wo-da.de:9543/EAMD.ucp/installation-status.log)
  - [Structr Server (test.wo-da.de)](https://test.wo-da.de:9183/structr/)
- Live Server
  - [https://test.wo-da.de:9183/structr/#schema](https://test.wo-da.de:9183/structr/#schema) (!!!)
  - [NEOM Structr Schema](../1919713281/NEOM_Structr_Schema.md)
    - [https://test.wo-da.de:8083/structr/#schema](https://test.wo-da.de:8083/structr/#schema) (!!!)
  - [NEOM - WODA.test - infrastructure and servers](../1879932936/NEOM_-_WODA.test_-_infrastructure_and_servers.md)
    - [Jenkins server on WODA.test](../1880096773/Jenkins_server_on_WODA.test.md)
    - [PlantUML on WODA.test](../1879769146/PlantUML_on_WODA.test.md)

> [!CAUTION]
> - [https://test.wo-da.de:8083/structr/#schema](https://test.wo-da.de:8083/structr/#schema) is currently on Structr test/sprint29
> - DO NOT BACKUP with jenkins
> - restore from current master Schema on  
> [https://test.wo-da.de:9183/structr/#schema](https://test.wo-da.de:9183/structr/#schema)

### [https://prod.wo-da.de](https://prod.wo-da.de)

Stand 25.04.2023 - deployment stand von vor Neom

```
commit 6dc08aa09de71d132b34cc2892c8ea364640af52 (HEAD -> sprint29, origin/test/sprint29, test/sprint29)
Merge: 2f023ce34 b13cdbd4f
Author: freemium user <freemiumuser@example.com>
Date:   Fri Apr 22 14:18:49 2022 +0200

    Merge branch 'test/sprint29' of bitbucket.org:donges/eamd.ucp into test/sprint29
```

TODO: comes up with Once not with WODA.  
FIXED currently hard on the Once.class.js - will be killed by next checkout….