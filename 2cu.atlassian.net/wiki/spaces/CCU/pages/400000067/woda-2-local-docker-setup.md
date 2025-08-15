[📁 Learning Documentation And Videos GitHub](/cerulean-circle-unlimited-2cu/product/development/learning-documentation-and-videos.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/learning-documentation-and-videos/woda-2-local-docker-setup.md) | [🌐 Index Structure local SymLink](./woda-2-local-docker-setup.entry.md)

# WODA 2 Local Docker Setup

Before proceeding with docker image you have to install docker

1. Install Docker & Docker Compose In Ubuntu
  1. [https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker ${USER}
```
2. Install Docker & Docker Compose In Arch
  1. [https://computingforgeeks.com/installing-docker-ce-ubuntu-debian-fedora-arch-centos/](https://computingforgeeks.com/installing-docker-ce-ubuntu-debian-fedora-arch-centos/)
```
yay -S --noconfirm --needed docker
yay -S --noconfirm --needed docker-compose
sudo usermod -aG docker ${USER}
```
3. Install Docker & Docker Compose In Windows
  1. [https://runnable.com/docker/install-docker-on-windows-10](https://runnable.com/docker/install-docker-on-windows-10)
```
pip install -U docker-compose
```
4. Install Docker & Docker Compose In Mac
  1. [https://runnable.com/docker/install-docker-on-macos](https://runnable.com/docker/install-docker-on-macos)

**List Of Docker Files/Images At Location**:

/var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1\_infrastructure/DockerWorkspaces

**How To Start Docker Images**

1. **On Server (Docker Server Specific Images)**
  - Nginx Proxy, Certbot, WODA & Structr Server
```
Start Manually
  1. cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/
  2. ./buildDockerFileServer
  3. ./runDockerFileServer
Start Using Once
  1. once docker woda server build
  2. once docker woda server run
```
  - Nginx Proxy & Certbot With Alpine
```
Start Manually  
  1. cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Nginx/1.15/certbot/1.7.0/test.wo-da.de/
  2. ./buildDocker
  3. ./runDocker
Start Using Once
 1. once docker proxy-ssl build
 2. once docker proxy-ssl run
```
2. **On Local**
  1. WODA & Structr Server
```
Start Manually
  1. /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/
  2. ./buildDockerFileLocal
  3. ./runDockerFileLocal
Start Using Once
  1. once docker woda local build
  2. once docker woda local run
```
3. **On Local & Server Both**
  1. WODA Application With Nodejs & Alpine
```
Start Manually
  1. cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Nodejs/14/
  2. ./buildDocker
  3. ./runDocker
Start Using Once
 1. once docker nodejs build
 2. once docker nodejs run
```
  2. Structr Server With Alpine
```
Start Manually
  1. cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/WODA/1.0.0/Alpine/3.13.2/Openjdk/8/Structr/2.1.4/
  2. ./buildDocker
  3. ./runDocker
Start Using Once
 1. once docker structr build
 2. once docker structr run
```
  3. NakedAlpine / MinimalLinux
```
Start Manually
  1. cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/nakedAlpine/3.13.2/
  2. ./buildDockerfile
  3. ./runDockerfile
Start Using Once
 1. once docker nakedalpine build
 2. once docker nakedalpine run
```
  4. NakedUbuntu
```
Start Manually
  1. cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/nakedUbuntu18.4/
  2. ./buildDockerfile
  3. ./runDockerfile
Start Using Once
 1. once docker nakedubuntu build
 2. once docker nakedubuntu run
```
  5. NakedDebian
```
Start Manually
  1. cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/nakedDebian9.12/
  2. ./buildDockerfile
  3. ./runDockerfile
Start Using Once
 1. once docker nakeddebian build
 2. once docker nakeddebian run
```

**Old Docker Images Details**

1. Structr Docker
  1. File Location: /var/dev/EAMD.ucp/3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/local/structr/1.0.0
  2. Run / Start Docker
    1. ./buildDocker
    2. ./runDocker
2. WODA Docker With Nginx
  1. File Location: /var/dev/EAMD.ucp/3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/local/woda/nginx/1.0.0
  2. Run / Start Docker
    1. ./buildDocker
    2. ./runDocker
3. WODA Docker With Nodejs
  1. File Location: /var/dev/EAMD.ucp/3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/local/woda/nodejs/1.0.0
  2. Run / Start Docker
    1. ./buildDocker
    2. ./runDocker
4. WODA Docker Combine Images Without SSL
  1. File Location: /var/dev/EAMD.ucp/3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/local/combine/1.0.0
  2. Run / Start Docker
    1. ./buildDocker
    2. ./runDocker
5. WODA Docker Combine Images With OPENSSL
  1. File Location: /var/dev/EAMD.ucp/3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/server/combine/openssl/1.0.0
  2. Run / Start Docker
    1. ./buildDocker
    2. ./runDocker
6. WODA Docker Combine Images With SSL
  - CERTBOT, WODA, STRUCTR, NODEJS & NGINX Single Image
    1. File Location: /var/dev/EAMD.ucp/3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/server/combine/letsencrypt/default/1.0.0
    2. Run / Start Docker
      1. ./init-letsencrypt.sh (Only on first run or when you want update ssl)
      2. ./buildDocker
      3. ./runDocker
  - CERTBOT, WODA, STRUCTR, NODEJS & NGINX Multiple Image With Single Docker Compose
    1. File Location: /var/dev/EAMD.ucp/3rdPartyComponents/org/structr/StructrServer/woda2.local/docker/server/combine/letsencrypt/certbot-nginx-nodejs-structr/1.0.0
    2. Run / Start Docker
      1. ./init-letsencrypt.sh (Only on first run or when you want update ssl)
      2. ./buildDocker
      3. ./runDocker

Note: Ports used by applications are 80 443 8080 8082 8083 8021 7475

Imp Urls:

1. [https://test.wo-da.de/](https://test.wo-da.de/) (WODA Default Page)
2. [https://test.wo-da.de/woda](https://test.wo-da.de/woda) (WODA Default Panel Page)
3. [https://test.wo-da.de/EAMD.ucp/](https://test.wo-da.de/EAMD.ucp/) (WODA Default Component Page)
4. [http://test.wo-da.de/structr/#logout](http://test.wo-da.de/structr/#logout) (WODA Default Structr Page)
5. [http://test.wo-da.de:8082/structr/#logout](http://test.wo-da.de:8082/structr/#logout) (WODA Default structr Login Page)
