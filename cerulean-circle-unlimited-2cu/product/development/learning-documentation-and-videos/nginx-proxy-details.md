# Nginx Proxy Details

Nginx Docker Proxy is used for redirect / point port number with url to easily access

Docker File Location:

```
/var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Nginx/1.15/certbot/1.7.0/test.wo-da.de/
```

Following are the list of port and url used:

1. `/structr` is mapped with port 8082 (http) 8083 (https)
2. Port 80 is mapped with port 8080 on all server (On Test server port number is 8081)
3. `/woda` is mapped with port 8080/woda (On Test server port number is 8081/woda)
4. `/EAMD.ucp` is mapped with port 8080/EAMD.ucp (On Test server port number is 8081/EAMD.ucp)
5. `/auth` is mapped with port 9080/auth (Keycloack)
6. `/snet` is mapped with port 9081 (Jhipster)

To Add new proxy modify file:

```
/var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Nginx/1.15/src/app.conf
```

After adding proxy restart docker with:

```
cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Nginx/1.15/certbot/1.7.0/test.wo-da.de/
./runDocker
```

For ssl renewal run --- outdated:

```
cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Nginx/1.15/certbot/1.7.0/test.wo-da.de/
./buildDocker
./init-letsencrypt.sh
```

new: [WODA.test Server Migration](./2cu.atlassian.net/wiki/spaces/CCU/pages/1805287425/WODA.test_Server_Migration.md)

```
cd /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/Nginx.v1.21.3
docker-compose up -d

```