[📁 Coast GitHub](/cerulean-circle-unlimited-2cu/product/development/coast.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/coast/eamducp-repository.md) | [🌐 Index Structure local SymLink](./eamducp-repository.entry.md)

# EAMD.ucp Repository

The EAMD.ucp Repository is the foundation for Web 4.0, the Internet of Services.

Version 1.0 was created at Deutsche Bahn to Manage their Data Centers with CMM level 4 maturity: [https://box.donges.it/index.php/s/I4JZduFooQqVSiQ](https://box.donges.it/index.php/s/I4JZduFooQqVSiQ)

EAMD stands for "Enterprise Architecture Management" **Descriptors**. The “.ucp” stands for the Component Standard that is used in Web 4.0:  
[Units - Components - Packages](../../../../2cu.atlassian.net/wiki/spaces/CCU/pages/288981051/UCP.md)  
in short [UCP](./eamducp-repository/UCP.md)  
or UcpComponents

The repository is a “maven" ([Apache maven](https://maven.apache.org/)) like file structure that servers component oriented development in any programing Language or technology.

## Default Locations

```
/EAMD.ucp                 (not possible on MacOS because of readonly root file system)
/var/dev/EAMD.ucp         (normaly exists on no system and can be created uniqely)
/home/$USER/dev/EAMD.ucp  (only if the system needs to be installed user specific)
```

Whenever possible the EAMD.ucp directory is a root filesystem folder `/EAMD.ucp` specifying all configuration management on a machine. By default it is a **symbolic link** to the default installation location `/EAMD.ucp --> /var/dev/EAMD.ucp`  
When all of these locations are not permitted, the configuration falls back to  
the values of the environment variables  
`workspacePrefix=/var/dev/`  
`EAMDdirectoryName=EAMD.ucp`  
`EAMDworkspace=$workspacePrefix/$EAMDdirectoryName/`

## Structure of the Repository

- EAMD.ucp
  - Components
    - TLD
      - Domain
        - EAM…
  - Scenarios
    - TLD
      - vhostDomain
        - Stage
          - EAM…
- …EAM
  - Layer
    - Namespaces
      - ComponentPackage
        - Version
          - Some.component.xml
          - dist
          - src…
          - test
- ..src
  - assets
  - language

Where:

Components ………..: root directory for Namespaces and UcpComponents  
  
TLD …………………….: Top Level Domain e.g.: \[com, net, tla,…\]  
Domain ……….……….: legal persons internet name  
EAM ……………………: Enterprise Architecture Management  
Layer ……………….…: EAM layer e.g.: \[layer1, layer2, layer3, layer4, layer5\] or \[1\_infrastructure, 2\_systems, 3\_services, 4\_processes, 5\_ux\]

Scenarios ……..……..: root directory for Namespaces and Scenario Descriptors, which are Instance Configuration Descriptors

TLD …………………….: Top Level Domain e.g.: \[com, net, tla,…\]  
vhostDomain ……….: root directory for a virtual host server from this machine  
Stage ………………….: environment scope e.g.: \[1\_dev, 2\_test, 3\_int(egration), 4\_prod(uction)\]

and

- Scenarios/TLD/Domain/
  - 1\_dev
    - EAM
      - 1\_infrastructure
        - Interface or Service
          - SomeInstance.scenario.xml
