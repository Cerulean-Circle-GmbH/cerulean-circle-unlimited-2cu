[📁 Q Nnect](../q-nnect.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000125/new-domain.md) | [🌐 Page Structure local SymLink](./new-domain.page.md)

# New Domain

stable Branch:

git checkout -t origin/MpgDashboard

neue Q nextcloud mit Qtalk

[https://qcloud-backup.q-nnect.com](https://qcloud-backup.q-nnect.com) user [marcel@donges.it](mailto:marcel@donges.it) auf nextcloud

Momentan nicht benötigt:

WhatsApp

\[16:12\] Matthias Greiner (Q-nnect AG) (Guest)       - LETSENCRYPT\_HOST=$DOMAIN\_WODA       - [LETSENCRYPT\_EMAIL=matthias.greiner@q-nnect.com](mailto:LETSENCRYPT_EMAIL=matthias.greiner@q-nnect.com)

​

\[16:13\] Matthias Greiner (Q-nnect AG) (Guest)       - VIRTUAL\_PORT=8080       - VIRTUAL\_HOST=$DOMAIN\_WODA

wodaq.q-nnect.com

```
~/.once
==========================
export ONCE_DEFAULT_SCENARIO=/var/dev/EAMD.ucp/Scenarios/com/q-nnect/woda/EAM/1_infrastructure/Once/latestServer
. /var/dev/EAMD.ucp/Scenarios/com/q-nnect/woda/EAM/1_infrastructure/Once/latestServer/.once
PATH=.:/root/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/var/dev/EAMD.ucp/Scenarios/com/q-nnect/woda/EAM/1_infrastructure/Once/latestServer/oosh/:/var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/OOSH/1.0.0/src/sh:/var/dev/EAMD.ucp/Scenarios/localhost/EAM/1_infrastructure/Once/latestServer/oosh:/var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/NewUserStuff/scripts
==========================


```

```
export ONCE_DEFAULT_HOST=test.wo-da.de
export ONCE_DEFAULT_KEYCLOAK_SERVER='{ "realm": "master", "clientId": "shifternetzwerk", "url": "https://test.wo-da.de/auth"}'
export ONCE_DEFAULT_SCENARIO=/var/dev/EAMD.ucp/Scenarios/com/q-nnect/woda/EAM/1_infrastructure/Once/latestServer
export ONCE_DEFAULT_SERVER=test.wo-da.de
export ONCE_DEFAULT_SSH_IP=178.254.36.232
export ONCE_DEFAULT_UDE_STORE=https://localhost:8443
export ONCE_DEFAULT_URL=https://localhost:8443
export ONCE_DIR=/var/dev/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/latestServer
export ONCE_DIRECT_HTTPS_URL=https://localhost:8443
export ONCE_DOMAIN=
export ONCE_INITIAL_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export ONCE_LATEST_BRANCH=test/sprint17
export ONCE_LOAD_DIR=/var/dev/EAMD.ucp/Scenarios/localhost/EAM/1_infrastructure/Once/latestServer/oosh
export ONCE_LOCAL_SERVER=192.168.178.49:8080
export ONCE_MODE=LOCAL
export ONCE_PATHS=/var/dev/EAMD.ucp/Scenarios/com/q-nnect/woda/EAM/1_infrastructure/Once/latestServer/paths
export ONCE_PM='apt-get -y install'
export ONCE_PM_UPDATED='apt-get update'
export ONCE_POSTGRES_CONNECTION_STRING=postgresql://root:qazwsx123@localhost:5433/oncestore
export ONCE_PRIVILEGE=root
export ONCE_REPO_COMPONENTS=Components
export ONCE_REPO_NAME=EAMD.ucp
export ONCE_REPO_PREFIX=/var/dev
export ONCE_REPO_SCENARIOS=Scenarios
export ONCE_SCENARIO=/var/dev/EAMD.ucp/Scenarios/com/q-nnect/woda/
export ONCE_SCENARIO_BRANCH=test/main
export ONCE_SERVER_PID=
export ONCE_SHELL=/bin/bash
export ONCE_SHELL_RC='~/.bashrc'
export ONCE_STATE=scenario
export ONCE_STRUCTR_SERVER=https://test.wo-da.de:8083

```

\[19:18, 10/21/2021\] Matthias Greiner: [https://qworld-woda.q-nnect.com/](https://qworld-woda.q-nnect.com/) ist jetzt deine Instanz mit deinen Daten (vorher wodaq)  
\[19:18, 10/21/2021\] Matthias Greiner: [https://qworld-woda2.q-nnect.com/](https://qworld-woda2.q-nnect.com/) ist die instanz bei uns  
\[19:18, 10/21/2021\] Matthias Greiner: [https://woda.q-nnect.com/](https://woda.q-nnect.com/) ist die ganz alte plattform, die wir sobald du mir dein ok gibst (morgen im meeting) plattmachen können

[woda.q-necct.com](http://woda.q-necct.com) => [WODA](#)  
[wodaq.q-nnect.com](#) getData URL ONCE.ENV.ONCE\_Q\_SERVER

once config

```
export ONCE_Q_SERVER=https://qworld-woda.q-nnect.com
```
