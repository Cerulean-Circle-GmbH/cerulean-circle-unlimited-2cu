[📁 Infrastructure Value Stream Overview](../infrastructure-value-stream-overview.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/300000062/update-certificates-with-lets-encrypt.md) | [🌐 Page Structure local SymLink](./update-certificates-with-lets-encrypt.page.md)

# Update Certificates with Lets-encrypt

- [on http://prod.wo-da.de](#on-httpprodwo-dade)
- [on test.wo-da.de](#on-testwo-dade)
  - [Update Structr certificates](#update-structr-certificates)
    - [notes](#notes)
  - [old Structr](#old-structr)
- [Troubleshooting](#troubleshooting)

# on [http://prod.wo-da.de](http://prod.wo-da.de)

Stand: 24.05.2023

force new certificate generation

```
once docker.scenario.stop certbot
once docker.scenario.create certbot prod.wo-da.de
```

force update certficate in structr docker image if new structr certificates are availabe

```
once docker.scenario.stop structr
once docker.scenario.create structr 

docker logs -f once-structr-server
```

restart once

```
once find
once stop
once restart
```

# on [test.wo-da.de](http://test.wo-da.de)

Stand 22.09.2022

```
[oosh WODA.test] root@v36421:
  /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/Nginx.v1.21.3 
  > docker ps

CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS              PORTS                                                                                                                                                 NAMES
e361d1d22088   nginx:1.21.3-alpine   "/docker-entrypoint.…"   16 minutes ago   Up About a minute   0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:443->443/tcp, :::443->443/tcp                                                                              nginx_proxy
69a9208cb388   jboss/keycloak        "/opt/jboss/tools/do…"   2 months ago     Up 2 months         0.0.0.0:9080->9080/tcp, :::9080->9080/tcp, 0.0.0.0:9443->9443/tcp, :::9443->9443/tcp, 0.0.0.0:9990->9990/tcp, :::9990->9990/tcp                       1204_keycloak_1
07c25aa45d63   postgres:13           "docker-entrypoint.s…"   2 months ago     Up 2 months         0.0.0.0:5439->5432/tcp, :::5439->5432/tcp                                                                                                             1204_postgres_1
3c058dd88e90   postgres:12.2         "docker-entrypoint.s…"   4 months ago     Up 4 months         0.0.0.0:5433->5432/tcp, :::5433->5432/tcp                                                                                                             once-postgresql
9166eb6f1a05   structr:2.1.4         "bin/start-structr.sh"   5 months ago     Up 4 months         0.0.0.0:8021->8021/tcp, :::8021->8021/tcp, 0.0.0.0:8082-8083->8082-8083/tcp, :::8082-8083->8082-8083/tcp, 0.0.0.0:7574->7688/tcp, :::7574->7688/tcp   once-structr-server

```

Stop all `nginx_proxy` and certbot instances

```
docker stop e361d1d22088
docker stop .... (certbot CONTAINET ID) was not up this time
```

Restart containers

```
cd /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/Nginx.v1.21.3/
docker-compose up -d
cd ../CertBot.v1.7.0/
dc up -d

[oosh WODA.test] root@v36421:
  /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/CertBot.v1.7.0 
  > docker ps
CONTAINER ID   IMAGE                 COMMAND                  CREATED          STATUS          PORTS                                                                                                                                                 NAMES
e361d1d22088   nginx:1.21.3-alpine   "/docker-entrypoint.…"   20 minutes ago   Up 5 minutes    0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:443->443/tcp, :::443->443/tcp                                                                              nginx_proxy
1aac4d5bb8bd   certbot/certbot       "/bin/sh -c 'trap ex…"   2 months ago     Up 26 seconds   80/tcp, 443/tcp                                                                                                                                       certbot
69a9208cb388   jboss/keycloak        "/opt/jboss/tools/do…"   2 months ago     Up 2 months     0.0.0.0:9080->9080/tcp, :::9080->9080/tcp, 0.0.0.0:9443->9443/tcp, :::9443->9443/tcp, 0.0.0.0:9990->9990/tcp, :::9990->9990/tcp                       1204_keycloak_1
07c25aa45d63   postgres:13           "docker-entrypoint.s…"   2 months ago     Up 2 months     0.0.0.0:5439->5432/tcp, :::5439->5432/tcp                                                                                                             1204_postgres_1
3c058dd88e90   postgres:12.2         "docker-entrypoint.s…"   4 months ago     Up 4 months     0.0.0.0:5433->5432/tcp, :::5433->5432/tcp                                                                                                             once-postgresql
9166eb6f1a05   structr:2.1.4         "bin/start-structr.sh"   5 months ago     Up 4 months     0.0.0.0:8021->8021/tcp, :::8021->8021/tcp, 0.0.0.0:8082-8083->8082-8083/tcp, :::8082-8083->8082-8083/tcp, 0.0.0.0:7574->7688/tcp, :::7574->7688/tcp   once-structr-server

```

Check the certificates

```
[oosh WODA.test] > once scenario.check
Current ONCE_DEFAULT_SCENARIO                   is: /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Once/latestServer
        ONCE_SCENARIO                           is: /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test

[oosh WODA.test] > cd /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Once/latestServer
[oosh WODA.test] > ll
total 78020
drwxr-xr-x 5 root root     4096 Jul 14 06:56 ./
drwxr-xr-x 3 root root     4096 Apr 19 14:30 ../
-rw-r--r-- 1 root root     4387 Jul 14 06:56 .once
-rw-r--r-- 1 root root     2987 Apr 19 14:30 .once.bene
lrwxrwxrwx 1 root root      108 Apr 19 14:38 .once.env -> /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Once/latestServer/.once
-rw-r--r-- 1 root root     4386 Jul 14 06:55 .once.new
-rw-r--r-- 1 root root  3370268 Sep 22 09:56 14-07-22_06:56:05.once.log
-rw-r--r-- 1 root root 76444780 Jul 14 06:44 16-05-22_11:01:46.once.log
drwxr-xr-x 4 root root     4096 May 12 17:08 PostgreSQL.v12.2/
drwxr-xr-x 4 root root     4096 May 12 15:21 PostgreSQL.v12.2.latest/
lrwxrwxrwx 1 root root       67 Apr 21 15:37 once.cert.pem -> ../../Docker/CertBot.v1.7.0/config/conf/live/test.wo-da.de/cert.pem
lrwxrwxrwx 1 root root       72 Apr 21 16:23 once.fullchain.pem -> ../../Docker/CertBot.v1.7.0/config/conf/live/test.wo-da.de/fullchain.pem
lrwxrwxrwx 1 root root       70 Apr 21 15:37 once.key.pem -> ../../Docker/CertBot.v1.7.0/config/conf/live/test.wo-da.de/privkey.pem
lrwxrwxrwx 1 root root      129 Jul 14 06:56 once.log -> /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Once/latestServer/14-07-22_06:56:05.once.log
drwxr-xr-x 2 root root     4096 Apr 19 14:30 onceServer.old/
-rw-r--r-- 1 root root       91 Apr 19 14:30 package-lock.json
-rw-r--r-- 1 root root     2521 Apr 19 14:44 scenario.map

[oosh WODA.test] > cd ../../Docker/CertBot.v1.7.0/config/conf/live/test.wo-da.de
[oosh WODA.test] > ll
total 12
drwxr-xr-x 2 root root 4096 Sep 22 09:36 ./
drwxr-xr-x 3 root root 4096 Apr 19 16:27 ../
-rw-r--r-- 1 root root  692 Apr 19 16:27 README
lrwxrwxrwx 1 root root   37 Sep 22 09:36 cert.pem -> ../../archive/test.wo-da.de/cert3.pem
lrwxrwxrwx 1 root root   38 Sep 22 09:36 chain.pem -> ../../archive/test.wo-da.de/chain3.pem
lrwxrwxrwx 1 root root   42 Sep 22 09:36 fullchain.pem -> ../../archive/test.wo-da.de/fullchain3.pem
lrwxrwxrwx 1 root root   40 Sep 22 09:36 privkey.pem -> ../../archive/test.wo-da.de/privkey3.pem
```

## Update Structr certificates

stand 16.02.2023

how to find the right docker location

```
docker inspect <id> | line find "com.docker.compose.project.working_dir"
```

```
cd /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/2_systems/Docker/StructrServer.v2.1.4
```

### notes

```
cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nginx/Nginx/1.15/certbot/1.7.0
buildDocker

FAILED!

cd /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/Nginx.v1.21.3
docker-compose down

cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Nginx/1.15/certbot/1.7.0/test.wo-da.de

```

history

```
once docker.scenario.create certbot test.wo-da.de


1900  cd ssl/
 1901  ll
 1902  tree
 1903  cd data/certbot/conf/live/
 1904  ll
 1905  cd test.wo-da.de,/
 1906  ll
 1907  cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine
 1908  cd 3.13.2/Nginx/
 1909  ll
 1910  tree
 1911  cd 1.15/certbot/1.7.0/test.wo-da.de/
 1912  ll
 1913  docker ps
 1914  docker stop 1aac4d5bb8bd
 1915  docker stop e2ce85bf3ac2
 1916  docker ps
 1917  cd
 1918  once 
 1919  once status
 1920  once state
 1921  once states.list 
 1922  once docker.scenario.status docker.scenario.status docker.scenario.status docker.scenario.status cert
 1923  once docker.scenario.status docker.scenario.status docker.scenario.status docker.scenario.start cert
 1924  docker ps
 1925  cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine
 1926  cd 3.13.2/Nginx/1.15/certbot/1.7.0/test.wo-da.de/
 1927  ll
 1928  buildDocker 
 1929  systemctl start apache2
 1930  buildDocker 
 1931  systemctl stop apache2
systemctl stop apache2
 1932  docker ps
 1933  buildDocker 
 1934  ll
 1935  docker ps
 1936  systemctl status apache2
 1937  systemctl start pache2
 1938  systemctl start apache2
 1939  journalctl -xe
 1940  systemctl status apache2
 1941  docker ps
 1942  docker log e506e36f9866
 1943  docker logs e506e36f9866
 1944  docker logs -f e506e36f9866
 1945  docker stop e506e36f9866
 1946  docker ps
 1947  systemctl start apache2
 1948  systemctl status apache2
 1949  cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Nginx/1.15
 1950  ll
 1951  cd src/
 1952  ll
 1953  cat app.conf 
 1954  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nginx/Nginx/1.15/certbot/1.7.0
 1955  ll
 1956  docker ps
 1957  buildDocker 
 1958  systemctl status apache2
 1959  systemctl stop apache2
 1960  systemctl status apache2
 1961  buildDocker 
 1962  docker ps
 1963  systemctl status apache2
1964  cd ..
 1965  ll
 1966  cd ..
 1967  ll
 1968  cd /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker
 1969  ll
 1970  cd CertBot.v1.7.0/
 1971  ll
 1972  cd ..
 1973  Nginx.v1.21.3/
 1974  lll
 1975  ll
 1976  cd Nginx.v1.21.3/
 1977  ll
 1978  tree
 1979  docker-compose up -d
 1980  docker ps
 1981  docker stop bbe2c553975d
 1982  docker-compose up -d
 1983  docker ps
 1984  cd /var/dev/EAMD.ucp/
 1985  git status
 1986  git pull


```

## old Structr

```
cd /var/dev/EAMD.ucp/3rdPartyComponents/org/structr/StructrServer/2.1.4/src

structr-ssl-gen-update
```

still a non final hack

```
once docker.scenario.stop structr
once update.structr.certificates
once docker.scenario.start structr.  (does not add the new keys)
```

# Troubleshooting

Problem

```
ping github.com
ping: github.com: Temporary failure in name resolution

```

Solution

```
systemctl restart systemd-resolved.service

```
