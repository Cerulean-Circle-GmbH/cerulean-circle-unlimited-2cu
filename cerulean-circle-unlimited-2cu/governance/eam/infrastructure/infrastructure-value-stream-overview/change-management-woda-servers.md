# Change Management WODA servers

- [Docker Images](#docker-images)
  - [Structr Server](#structr-server)
    - [current location](#current-location)
      - [current structr.zip duplicates](#current-structrzip-duplicates)
    - [future location](#future-location)
    - [Iteration 2](#iteration-2)
  - [Ngnix Server](#ngnix-server)
- [Structr Image](#structr-image)
  - [Structr ToDos](#structr-todos)
    - [add the localhost once certificates to Structr too](#add-the-localhost-once-certificates-to-structr-too)
- [KeyCloak and ShifterNetzwerkServer](#keycloak-and-shifternetzwerkserver)

# Docker Images

```
woda2.local/
├── docker
│   ├── local
│   │   ├── combine
│   │   │   └── 1.0.0
│   │   │       ├── Dockerfile
│   │   │       ├── buildDocker
│   │   │       ├── default
│   │   │       ├── docker-compose.yml
│   │   │       ├── nginx.conf
│   │   │       ├── runDocker
│   │   │       ├── start-structr.sh
│   │   │       └── structr.conf
│   │   ├── structr
│   │   │   └── 1.0.0
│   │   │       ├── Dockerfile
│   │   │       ├── Readme.md
│   │   │       ├── buildDocker
│   │   │       ├── docker-compose.yml
│   │   │       ├── runDocker
│   │   │       ├── start-structr.sh
│   │   │       └── templates
│   │   │           ├── id_rsa
│   │   │           ├── id_rsa.pub
│   │   │           ├── known_hosts
│   │   │           └── structr.conf
│   │   └── woda
│   │       ├── nginx
│   │       │   └── 1.0.0
│   │       │       ├── Dockerfile
│   │       │       ├── buildDocker
│   │       │       ├── default
│   │       │       ├── docker-compose.yml
│   │       │       ├── nginx.conf
│   │       │       └── runDocker
│   │       └── nodejs
│   │           └── 1.0.0
│   │               ├── Dockerfile
│   │               ├── buildDocker
│   │               ├── docker-compose.yml
│   │               ├── runDocker
│   │               └── start-nodejs.sh
│   └── server
│       └── combine
│           ├── letsencrypt
│           │   ├── certbot-nginx-nodejs-structr
│           │   │   └── 1.0.0
│           │   │       ├── Dockerfile
│           │   │       ├── data
│           │   │       │   ├── certbot
│           │   │       │   │   └── conf
│           │   │       │   ├── nginx
│           │   │       │   │   └── app.conf
│           │   │       │   └── structr
│           │   │       │       ├── Dockerfile
│           │   │       │       ├── start-structr.sh
│           │   │       │       └── structr.conf
│           │   │       ├── docker-compose.yml
│           │   │       ├── init-letsencrypt.sh
│           │   │       ├── runDocker
│           │   │       └── start-nodejs.sh
│           │   ├── default
│           │   │   └── 1.0.0
│           │   │       ├── Dockerfile
│           │   │       ├── buildDocker
│           │   │       ├── data
│           │   │       │   └── nginx
│           │   │       │       └── app.conf
│           │   │       ├── docker-compose.yml
│           │   │       ├── init-letsencrypt.sh
│           │   │       ├── runDocker
│           │   │       ├── start-structr.sh
│           │   │       └── structr.conf
│           │   └── test
│           │       └── 1.0.0
│           │           ├── Dockerfile
│           │           ├── data
│           │           │   ├── certbot
│           │           │   │   └── conf
│           │           │   ├── nginx
│           │           │   │   └── app.conf
│           │           │   └── structr
│           │           │       ├── Dockerfile
│           │           │       ├── start-structr.sh
│           │           │       └── structr.conf
│           │           ├── docker-compose.yml
│           │           ├── init-letsencrypt.sh
│           │           ├── runDocker
│           │           └── start-nodejs.sh
│           └── openssl
│               └── 1.0.0
│                   ├── Dockerfile
│                   ├── buildDocker
│                   ├── default
│                   ├── default.conf
│                   ├── docker-compose.yml
│                   ├── nginx.conf
│                   ├── runDocker
│                   ├── ssl.conf
│                   ├── start-structr.sh
│                   └── structr.conf
└── docs
    ├── Workspaces.zip
    └── structr.zip
```

## Structr Server

### current location

- /var/dev/EAMD.ucp/3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/local/structr/1.0.0

```
once structr.woda2local.start   

 now

once structr.start
deprecated.structr.start
```

#### current structr.zip duplicates

```
find . -name structr.zip

./3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/local/structr/1.0.0/structr.zip
./3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/server/combine/letsencrypt/certbot-nginx-nodejs-structr/1.0.0/data/structr/structr.zip
./3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/server/combine/letsencrypt/default/1.0.0/structr.zip
./3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/server/combine/letsencrypt/nodejs/1.0.0/structr.zip
./3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/server/combine/letsencrypt/test/1.0.0/data/structr/structr.zip
./3rdPartyComponents/org/structr/StructrServer/woda2.local/docs/structr.zip
./Components/org/structr/StructrServer/2.1.4/dist/structr.zip
```

### future location

concept fit for UCP Components and Scenarios

```
woda2.local/
├── docker
│   └── server
│       └── combine
│           ├── letsencrypt
│           │   ├── certbot-nginx-nodejs-structr
│           │   │   └── 1.0.0
│           │   │       ├── Dockerfile
│           │   │       ├── data
│           │   │       │   ├── certbot
│           │   │       │   │   └── conf
│           │   │       │   ├── nginx
│           │   │       │   │   └── app.conf
│           │   │       │   └── structr
│           │   │       │       ├── Dockerfile
│           │   │       │       ├── start-structr.sh
│           │   │       │       └── structr.conf
│           │   │       ├── docker-compose.yml
│           │   │       ├── init-letsencrypt.sh
│           │   │       ├── runDocker
│           │   │       └── start-nodejs.sh
```

```
../EAMD.ucp
../EAMD.ucp/Components
../EAMD.ucp/Components/com/nginx/NginxServer/1.15.0-alpine/NginxServer.component.xml
    dependency to 
      /EAMD.ucp/Components/org/structr/StructrServer/2.1.4/StructrServer.component.xml
                      ${org.structr.StructrServer.2_1_4:port}=8082
    property 
      $port
../EAMD.ucp/Components/org/structr/StructrServer/2.1.4/StructrServer.component.xml
    dependency to 
      /EAMD.ucp/Components/com/ubuntu/UbuntuServer/20.04/UbuntuServer.component.xml
              ${de.wo-da.test.EAM.layer1.UbuntuServer.20_04:hostName}
    property 
      $port
../EAMD.ucp/Components/org/structr/StructrServer/2.1.4/dist/structr.zip
└── docs
    └── structr.zip
../EAMD.ucp/Components/org/structr/StructrServer/2.1.4/dist/Neo4JData.zip
└── docs
    ├── Workspaces.zip

../EAMD.ucp/Scenarios
../EAMD.ucp/Scenarios/de/wo-da/              (dev env)
../EAMD.ucp/Scenarios/de/wo-da/test          (test env)
../EAMD.ucp/Scenarios/de/wo-da/test/com/ceruleanCircle/EAM/2_systems/WodaSystem/4.0.0/WodaSystem.component.xml
    dependency to 
      /EAMD.ucp/Components/org/structr/StructrServer/2.1.4/StructrServer.component.xml
      /EAMD..../Once/4.0.0
      /
    
    units
      build   ./buildDockerfile.sh
../EAMD.ucp/Scenarios/de/wo-da/test/com/ceruleanCircle/EAM/2_systems/WodaSystem/4.0.0/
  ../src/buildDockerfile.sh
  ../src/runDockerfile.sh
     ...
      
../EAMD.ucp/Scenarios/de/wo-da/test/EAM/layer1/..
  ../UbuntuServer/20.04/
      $hostName=test.wo-da.de
  ../UbuntuUbuntuServer/20.04/  
../EAMD.ucp/Scenarios/de/wo-da/test/EAM/layer1/..
  ../com/nginx/NginxServer/1.15.0-alpine/NginxServer.scenario.xml
      $port=80
  ../com/nginx/NginxServer/1.15.0-alpine/src/app.conf
                                (@todo make it a template)
                                ${com.nginx.NginxServer.1.15.0-alpine:hostName}
woda2.local/
├── docker
│   └── server
│       └── combine
│           ├── letsencrypt
│           │   ├── certbot-nginx-nodejs-structr
│           │   │   └── 1.0.0
│           │   │       ├── data
│           │   │       │   ├── nginx
│           │   │       │   │   └── app.conf  
  ../org/eff/certbot/CertBot/1.7.0/CertBot.scenario.xml
  ../org/eff/certbot/CertBot/1.7.0/src/init-letsencrypt.sh
  ../org/eff/certbot/CertBot/1.7.0/src/certbot/conf
  woda2.local/
├── docker
│   └── server
│       └── combine
│           ├── letsencrypt
│           │   ├── certbot-nginx-nodejs-structr
│           │   │   └── 1.0.0
│           │   │       ├── Dockerfile
│           │   │       ├── data
│           │   │       │   ├── certbot
│           │   │       │   │   └── conf

../EAMD.ucp/Scenarios/it/wo-da/              (poduction environment)
```

```
V4.0

../EAMD.ucp/Scenarios
../EAMD.ucp/Scenarios/de/wo-da/dev           (dev env)
../EAMD.ucp/Scenarios/de/wo-da/test          (test env)
../EAMD.ucp/Scenarios/de/wo-da/              (poduction environment)
```

### Iteration 2

```
/EAMD.ucp/Scenarios/org/eff/certbot/CertBot/1.7.0/src/init-letsencrypt.sh
/EAMD.ucp/Scenarios/org/eff/certbot/CertBot/1.7.0/src/wo-da.de
/EAMD.ucp/Scenarios/org/eff/certbot/CertBot/1.7.0/src/wo-da.it
/EAMD.ucp/Scenarios/org/eff/certbot/CertBot/1.7.0/src/test.wo-da.de

/EAMD.ucp/Scenarios/de/wo-da/EAM/1_infrastructure/Docker/NginxServer/1.15.0-alpine/src/app.conf
```

```
../EAMD.ucp/3rdPartyComponents/org/eff/certbot/CertBot/1.7.0/src/init-letsencrypt.sh
../EAMD.ucp/Scenarios/de/1blu/v32109/vhosts/de/wo-da/dev/EAM/1_infrastructure/Docker/CertBot/1.7.0/config/wo-da.de
../EAMD.ucp/Scenarios/de/1blu/v35469/vhosts/it/wo-da/EAM/1_infrastructure/Docker/CertBot/1.7.0/config/wo-da.it
../EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/CertBot/1.7.0/config/test.wo-da.de

../EAMD.ucp/Scenarios/de/wo-da/EAM/1_infrastructure/Docker/NginxServer/1.15.0-alpine/src/app.conf


../EAMD.ucp/Scenarios/de/1blu/v32109/vhosts/de/wo-da/dev/
    EAM/1_infrastructure/
      com/ubuntu/Server/16.04/UbuntuServer.scenario.xml
      Docker/
        CertBot/1.7.0/config/wo-da.de
        NginxServer/1.15.0-alpine/src/app.conf

../EAMD.ucp/Scenarios/de/1blu/v35469/vhosts/it/wo-da/
    EAM/1_infrastructure/
      com/ubuntu/Server/20.04/UbuntuServer.scenario.xml
      Docker/
        CertBot/1.7.0/config/wo-da.it
        NginxServer/1.15.0-alpine/src/app.conf
    
../EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/
    EAM/1_infrastructure/
      com/ubuntu/Server/20.04/UbuntuServer.scenario.xml
      Docker/
        CertBot/1.7.0/config/test.wo-da.de
        NginxServer/1.15.0-alpine/src/app.conf
```

## Ngnix Server

`../com/nginx/NginxServer/1.15.0-alpine/src/app.conf` Template Example

```
server {
    listen ${port};
    server_name ${de.wo-da.test.EAM.layer1.UbuntuServer.20_04:hostName};
    
    server_tokens off;
    root /var/dev;
    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {        
        autoindex on;
        proxy_pass  http://${de.wo-da.test.EAM.layer1.Ubuntu.20_04:hostname}:${tla.EAM.layer1.Thinglish.Once.4_0_0:port};
        proxy_set_header    Host                $http_host;
        proxy_set_header    X-Real-IP           $remote_addr;
        proxy_set_header    X-Forwarded-For     $proxy_add_x_forwarded_for;
    }
    location /woda {        
        autoindex on;
        proxy_pass  http://test.wo-da.de:${tla.EAM.layer1.Thinglish.Once.4_0_0:port}/woda;
        proxy_set_header    Host                $http_host;
...
    location /structr {        
        autoindex on;
        proxy_pass  http://${de.wo-da.test.EAM.layer1.UbuntuServer.20_04:hostName}:${org.structr.StructrServer.2_1_4:port}/structr;
        proxy_set_header    Host                $http_host;
        proxy_set_header    X-Real-IP           $remote_addr;
        
        
        
```

# Structr Image

During component creation in WODA, the components are generated inside of the structr docker image into the file system.  
The image is not suitable for this process yet! Find an error log file here: [/EAMD.ucp/Components/tla/EAM/layer3/IaaS/DedicatedServer/1.0.0/doc/creationStructr.log](http://test.wo-da.de/EAMD.ucp/Components/tla/EAM/layer3/IaaS/DedicatedServer/1.0.0/doc/creationStructr.log)

Things todo to fix it…. please create tickets for these:

- add /var/dev/EAMD.ucp as a volume to the structr image
- add packages to the installation of the image  
or enhance `eamd` shell file with `eamd cmd <package>` before calling the commands
  - git
  - tree
  - curl

Here are some important excerpts:

```
line 53 ff

12:18:36.962 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - EAMDRepository.bash: command:["eamd", "create", "component", "tla.EAM.layer3.IaaS.DedicatedServer"]
12:18:36.984 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - EAMDRepository.bash: unixProcess:java.lang.UNIXProcess@3a92fa3
12:18:36.985 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - EAMDRepository.bash: in:java.io.BufferedReader@49a8242d
12:18:37.108 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - /var/lib/structr/scripts/eamd: line 621: git: command not found
12:18:43.464 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - debconf: delaying package configuration, since apt-utils is not installed
12:18:44.093 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - /var/lib/structr/scripts/eamd: line 996: cd: /EAMD.ucp/Components/tla/EAM/layer3/IaaS/DedicatedServer/0.0.0-GIT-Repository/..: No such file or directory
12:18:44.103 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - /var/lib/structr/scripts/eamd: line 1002: cd: /EAMD.ucp/Components/tla/EAM/layer3/IaaS/DedicatedServer/0.0.0-GIT-Repository: No such file or directory
12:18:44.111 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - /var/lib/structr/scripts/eamd: line 903: cd: /EAMD.ucp/Components/tla/EAM/layer3/IaaS/DedicatedServer/0.0.0-GIT-Repository/0.0.0-GIT-Repository: No such file or directory
12:18:44.162 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - /var/lib/structr/scripts/eamd: line 1390: curl: command not found
12:18:44.221 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - /var/lib/structr/scripts/eamd: line 1390: curl: command not found
12:18:44.286 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - /var/lib/structr/scripts/eamd: line 1390: curl: command not found
12:18:44.340 [qtp760136533-151] INFO  o.structr.core.function.LogFunction - /var/lib/structr/scripts/eamd: line 634: git: command not found

```

### Structr ToDos

Localhost configuration:

currently "creating components" and "log in”only are fully tested on “http//:localhost:8080/woda".  
Currently the local configuration uses the following key entries to determine the use of Structr

```
> once config

in .../EAMD.ucp/Scenarios/box/fritz/iMacDonges-6/EAM/1_infrastructure/Once/latestServer/.once

export ONCE_STRUCTR_SERVER=http://localhost:5005
export ONCE_REVERSE_PROXY_CONFIG='[["auth","test.wo-da.de"],["snet","test.wo-da.de"],["structr","localhost:8082"]]'
```

#### add the localhost once certificates to Structr too

```
in .../EAMD.ucp/Scenarios/box/fritz/iMacDonges-6/EAM/1_infrastructure/Once/latestServer/

-rw-r--r--   1 donges  wheel   1.6K Jun  5 13:10 once.cert.pem
-rw-r--r--   1 donges  wheel   1.7K Jun  2 15:18 once.key.pem
```

these files are generated through

```
once ca                  # checks the Certification Authority
once ca.install          # installs Root Certificats for localhost with mkcert
once cu                  # updates or generates the certigicats in ONCE_DEFAULT_SCENARIO
```

# KeyCloak and ShifterNetzwerkServer

```
/var/dev/EAMD.ucp/Components/org/shift/EAM/2_systems/ShifterNetworkServer/1.0.0/ShifterNetworkServer.component.xml

/var/dev/EAMD.ucp/Scenarios/de/wo-da/test/EAM/2_systems/ShifterNetworkServer/1.0.0/ShifterNetworkServer.scenario.xml
/var/dev/EAMD.ucp/Scenarios/de/wo-da/test/EAM/2_systems/ShifterNetworkServer/1.0.0/db/
```