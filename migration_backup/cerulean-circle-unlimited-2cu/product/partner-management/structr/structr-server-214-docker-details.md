# Structr Server 2.1.4 Docker Details

Docker File Location

```
var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Openjdk/8/Structr/2.1.4/
```

Create SSL Certificate for Structr Server

```
1. copy fullchain.pem to /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Openjdk/8/Structr/2.1.4/src/
2. privkey.pem to /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Openjdk/8/Structr/2.1.4/src/
3. RUN "openssl pkcs12 -export -out keystore.pkcs12 -in fullchain.pem -inkey privkey.pem -password pass:qazwsx#123"


```

Docker Commands

```
docker-compose build (to build docker image)
docker-compose up (to start docker image)
docker-compose up --build (to rebuild & start docker image)
docker-compose down (to stop docker image)
```

Structr Server Ports

```
8082 for http
8083 for https
```