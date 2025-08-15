[📁 Once Install Guide](../once-install-guide.md) | [🌐 Page Structure GitHub](/2cu.atlassian.net/wiki/spaces/CCU/pages/400000075/install-and-deploy-keys-and-command-reference.md) | [🌐 Page Structure local SymLink](./install-and-deploy-keys-and-command-reference.page.md)

# Install and deploy keys (and command reference)

# WODA configurations

Ziel:

login to **woda.test** and **woda.dev** und **WODA.prod** possible

Steps:

| **Table of content** |
| --- |
| - [WODA configurations](#woda-configurations)<br>- [Details](#details)<br>  - [Command: ossh](#command-ossh)<br>  - [Command: user](#command-user)<br>  - [Directory: ids](#directory-ids)<br>  - [Deploy keys](#deploy-keys)<br>- [Bitbucket](#bitbucket) |

```
cd ~
sudo chown dierkwiedemann:dierkwiedemann -R .ssh (Your personal user :-) )
config.edit

Host WODA.dev
 User developking
 Port 22
 HostName cerulean.it
 IdentityFile ~/.ssh/ids/ssh.developking/id_rsa

ossh fix.rights
chmod 600 .ssh/ids/ssh.developking/id_rsa
 
user init (no addings)

ossh login WODA.dev
exit

<someone who already has access to the servers>
ossh pull.key WODA.dev nicoborn.DESKTOP-52GFVMQ.localdomain
ossh push.key WODA.test nicoborn.DESKTOP-52GFVMQ.localdomain.public_key.pulled
ossh push.key WODA.prod nicoborn.DESKTOP-52GFVMQ.localdomain.public_key.pulled

ossh push.key WODA.dev

ossh pull.config WODA.test WODA.prod
```

# Details

## Command: ossh

**Topic:**

ossh konsolidiert die Rechner Verwaltung

**important options:**

push

pull

(configs und identities kopieren)

ossh config create …

ossh config save last

## Command: user

**user** und **ossh** sind teilweise redundant

**ossh status** shows if ssh directory is available

**tree .ssh**/ shows content of ssh directory

**user init** creates environment

important directories

**private key** directory

**public key** directory

**inactive public keys** directory

authorized keys

**user update** authorized keys

## Directory: **ids**

**ids** directory (shallow copy from the pulled servers)

contains directories with complete key infrastructure (private, public etc) for a certain server e.g. github

```
│   │   │   └── once2023.githubCC
│   │   │       ├── id_rsa
│   │   │       ├── id_rsa.pub
│   │   │       ├── private_key
│   │   │       │   └── once2023.githubCC.private_key
│   │   │       └── public_keys
│   │   │           └── once2023.githubCC.public_key
```

corresponding GitHub Project: [https://github.com/Cerulean-Circle-GmbH/Once.2023](https://github.com/Cerulean-Circle-GmbH/Once.2023)

well documented in the github page

(invite people / developers on the github page / MD/MK needs to invite people to projects since it is r/o)

- [ ] [Matthias Kittner](https://2cu.atlassian.net/wiki/people/557058:23ebf09f-5406-4c92-84b7-ce7739b9b59a?ref=confluence) add Dierk to github

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

github → deploy keys → get public keys

## Deploy keys

[Add deploy key](https://github.com/Cerulean-Circle-GmbH/Once.2023/settings/keys/new)

- SSH**once2023.githubCC**`SHA256:Q6nqugh63aO5q/jMpV/MqhVBhtIGJuDbb+O9lFQIbxM`Added on Nov 28, 2022 by **@mdonges**Last used within the last 4 weeks — Read/write

6\. todo

Todo for the developers

- [ ] user init (create set of settings)
- [ ] provide keys

**ossh login WODA(.test)**

**ossh config.list**

push your personal public-key to WODA.test

**ossh config.edit**

change erroneous entries, will be added to the github ![(blue star)](https://2cu.atlassian.net/wiki/s/1732347312/6452/9ec310e9ed617fde640b4372fb0e11f5501675fa/_/images/icons/emoticons/72/1f603.png)

**ossh fix.rights**

(fix also rights for other directories which are not yet added to the ossh functionality)

# Bitbucket

Ziele: users see the needed repositories “EAMD.ucp” …

[https://bitbucket.org/dashboard/repositories](https://bitbucket.org/dashboard/repositories)

neue User zu Gruppe “2cudev” hinzufügen

Eigenen key as dem Benutzer des Entwicklungsrechner anzeigen:

```
cat ~/.ssh/id_rsa.pub
```

```
ossh config.list
```

add

```
Host 2cuBitbucket
 User git
 Port 22
 HostName bitbucket.org
 IdentityFile ~/.ssh/id_rsa
```

git config:

```
git config --global user.email "you@example.com"
 git config --global user.name "Your Name"
```

```
git pull
```

check connection:

```
ossh login 2cuBitbucket
```

fix permissions:

```
chown -R <user>:<user> EAMD.ucp
```

detected dubious ownership in repository at

```
 git config --global --add safe.directory /var/dev/EAMD.ucp
```

repair unwanted unmerged files

```
git reset --h
git checkout .
git status
git pull
```

Test git push in der IDE

sind andere Files eingecheckt

```
git fetch
git merge
git push
```
