# ONCE Documentation

- [Getting Started Overview](#getting-started-overview)
  - [Installation](#installation)
    - [Install step by step fully manual](#install-step-by-step-fully-manual)
    - [use the once.sh script](#use-the-oncesh-script)
    - [start on minimal docker](#start-on-minimal-docker)
    - [local native installation](#local-native-installation)
      - [start with a naked bash](#start-with-a-naked-bash)
  - [Using ONCE](#using-once)
    - [Start Once Server Local](#start-once-server-local)
    - [Starting Once as a service](#starting-once-as-a-service)
  - [Troubleshooting](#troubleshooting)

Todo chabters

- General Principles
- current Versions
  - 1.0.0
  - 2.0.0-ONE
  - 4.0.0
- Using ONCE
  - Client
  - Server

* * *

# Getting Started Overview

ONCE WODA made everything speak Thinglish…

## Installation

from zero to hero

### Install step by step fully manual

1. set up the repository  
The [EAMD.ucp repositories](../../development/coast/eamducp-repository.md) default location on any computer should be:  
`/var/dev/EAMD.ucp`  
Normally there is no `/var/dev` directory on any Linux distribution, so
  1. create the `dev` directory  
`cd /var`  
`mkdir dev`  
you need root rights to do this. so either login as root or sudo the command
  2. make sure that your default user has access to the directory later
    1. create a group, and a user in that group and change the ownership of the `/var/dev` directory
      1. `groupadd dev` or `addgroup dev` depending on your linux distribution
      2. `useradd -m -g dev someUser`
        1. 2 will create user…if the user already exists use `usermod -a -G dev existingUser`
      3. `chown -R someUser:dev /var/dev`
  3. enter the directory and clone the repository
    1. check the Bitbucket repository. Make sure you have access to the repository. To get access, please contact [Marcel Donges](https://2cu.atlassian.net/wiki/people/557058:26fa7b10-cf49-473c-81c1-fee4e574a9f7?ref=confluence) . Marcel will send an invitation which needs to accept to get access to Bitbucket repository.
      1. [https://bitbucket.org/donges/eamd.ucp/src/master/](https://bitbucket.org/donges/eamd.ucp/src/master/)
      2. Once you get access, add SSH key in Bitbucket under Profile → Personal Settings → SSH Keys
    2. clone the repository
      1. `git clone git@bitbucket.org:donges/eamd.ucp.git`
  4. rename the Repository
    1. Enterprise Architecture Management Descriptor .ucp Repository
      1. `mv /var/dev/eamd.ucp /var/dev/EAMD.ucp`
    2. to make sure you can see immediately that the computer is Web 4.0 enabled to add a link to the EAMD.ucp directory in the root filesystem
      1. `cd /`
      2. `ln -s /var/dev/EAMD.ucp`
  5. switch to branch “origin/dev"
    1. `git checkout -t origin/dev`
  6. follow the procedure in section '**start once local**' [./2cu.atlassian.net/wiki/spaces/CCU/pages/38436869/ONCE_Documentation.md#Start-Once-Server-Local](./2cu.atlassian.net/wiki/spaces/CCU/pages/38436869/ONCE_Documentation.md#Start-Once-Server-Local)
  7. [Run the application](./2cu.atlassian.net/wiki/spaces/CCU/pages/38436869/ONCE_Documentation.md#Start-Once-Server-Local)
    1. [http://localhost:8080/woda](http://localhost:8080/woda) - Main application
    2. [http://localhost:8080/EAMD.ucp/](http://localhost:8080/EAMD.ucp/) - Component Directory structure
  8. Drag and drop any component from **Component directory structure** to **Main application** overview panel.
    1. Example - Drag Google Map component ([http://localhost:8080/EAMD.ucp/Components/com/google/GoogleMap/1.0.0](http://localhost:8080/EAMD.ucp/Components/com/google/GoogleMap/1.0.0)) to **Main Application** overview panel.
    2. If the component is not visible then do '**npm install**' in the directory ***EAMD.ucp/Components/com/twitter/Bootstrap/3.3.7/src***  

### use the once.sh script

download link: [once.sh](http://test.wo-da.de/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/latestServer/src/sh/) `http://test.wo-da.de/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/latestServer/src/sh/once.sh`

more Usage Examples here: [Once.sh](./once-documentation/oncesh.md)

```
cd /var/dev/

curl http://test.wo-da.de/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/latestServer/src/sh/once.sh | bash -

OR

wget http://test.wo-da.de/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/latestServer/src/sh/once.sh -P ./init
chmod +x ./init/once.sh
/root/init/once.sh v
/root/init/once.sh init

. once path


------
cd
mkdir scripts
ln -s /var/dev/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/latestServer/src/sh/once.sh ~/scripts/once.sh

echo "PATH=$PATH:.:~/scripts/" >>~/.bashrc
----


OR with detailed debug log
bash -x ./once.sh
```

### start on minimal docker

```
To Start WODA using docker

Goto 
  cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/nakedAlpine/3.13.2/

Build Image Using
  ./buildDockerfile
  
Run / Start Docker Using
  ./runDockerFile (This will clone from git and setup everything)
  
  OR
  
  ./runDockerWithEAMD (This Use your existing report from /var/dev directory)
  
```

**Be aware**: the above docker image is a minimal linux with only 5 MB, that is capable of installing and running WODA and ONCE. BUT it is only good for testing the installation script. The `--rm` option will delete the docker image after it was stopped. Furthermore the image does not expose any ports or directories to the local system so it is not really usable and any work in the image will be lost after stopping it.

To permanently install ONCE and WODA do a native installation or start a preconfigured Docker image.

### local native installation

#### start with a naked bash

```
wget http://wo-da.de/EAMD.ucp/Components/tla/EAMD/UcpComponentSupport/1.0.0/src/sh/eamd 
chmod 777 eamd

PATH=$PATH:.

eamd init all


If eamd not run from different location the follow this 3 steps for debian & arch
1. sudo mv eamd /usr/local/bin/eamd
2. sudo chown root: /usr/local/bin/eamd
3. sudo chmod 755 /usr/local/bin/eamd

```

If you do not trust the script, execute it with the following command,  
and it will show you every line of code that is executed

```
eamd -X
```

What the script is capable of can be seen by just typing

```
eamd
```

To see the status of the installation and configuration use

```
eamd check
```

It will tell you what to do to fix the missing configuration.

## Using ONCE

### Start Once Server Local

```
Start Using Once

  1. once mode
  2. once start (to start)
  3. once stop (to stop)
  4. once help (to view more options)
  OR
  
    
Start Using npm

 cd /var/dev/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/latestServer/
 
 # direct after install make sure npm is installed and dependencies are updated 
 eamd cmd npm
 npm update
 
 npm start
 
 #start it as a backround process
 nohup npm start & 
 tail -f nohup.out
 
 
 @bring the process to the foreground
 fg
 
 # Control Z sussbends the foreground process
 
 # send the process into the background so that it continues without blocking the shell 
 bg
 
```

### Starting Once as a service

## Troubleshooting

```
alias ll="ls -alF"
. ˜/scripts/templeates/.bashrc

ln -s /EAMD.ucp/Components/tla/EAMD/UcpComponentSupport/1.0.0/src/sh/eamd /root/scripts/oosh
oosh v
oosh init links


eamd

groupadd dev
chown user:dev /var/dev
```

setup Bash and ssh

```
home directory

curl http://wo-da.de/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/NewUserStuff/scripts.zip -o scripts.zip
unzip scripts.zip

mv .bashrc .bashrc.backup
ln -s scripts/templates/.bashrc

bash

ssh.init

~/.ssh/id.rsa
~/.ssh/id_rsa.pub

publick_keys
  ....
  
  cat ˜/.ssh/...
```

other:

testing snipets

```
To Build & Run Ubuntu 20.04 Version

cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/nakedUbuntu/20.04/
docker build -t naked_ubuntu_20_04 .
docker run -it -p 8090:8080 -v /var/dev/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/latestServer/src/sh/:/usr/local/sbin naked_ubuntu_20_04 bash

To Build & Run Alpine Version

cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/nakedAlpine/3.13.2/
cd /var/dev/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/DockerWorkspaces/nakedAlpine/3.13.2/buildDockerfile
docker build -t naked_alpine .

With Git clone 
docker run -it -p 8090:8080 -v /var/dev/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/latestServer/src/sh/:/usr/local/sbin naked_alpine /bin/sh

With local repo
docker run -it -p 8090:8080 -v /var/dev/EAMD.ucp/Components/tla/EAM/layer1/Thinglish/Once/latestServer/src/sh/:/usr/local/sbin -v /var/dev:/var/dev naked_alpine /bin/sh




docker run -it -p 8090:8080 --rm alpine

docker run -it -p 8090:8080 --rm -v ~/scripts:/usr/local/sbin alpine







git checkout -t origin/dev


```