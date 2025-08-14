# WODA.prod

[http://prod.wo-da.de](http://prod.wo-da.de)

- [next certificate change on Thursday, 21 March 2024 at 13:08:23](#next-certificate-change-on-thursday-21-march-2024-at-130823)
  - [Todo befroe:](#todo-befroe)
- [14.03.2024](#14032024)
  - [current branch](#current-branch)
- [24.01.2024](#24012024)
  - [current branch](#current-branch)
- [23.10.2023](#23102023)
  - [current branch](#current-branch)
  - [branches before update](#branches-before-update)
  - [branch before update](#branch-before-update)

### next certificate change on  
Thursday, 21 March 2024 at 13:08:23

…

#### Todo befroe:

- [ ] clean `prod/woda`branch
- [ ] use version 2.4.2 as default now
- [ ] commit certificates in scenario
- [ ] check .gitignore in `Scenarios/de/1blu/v36421/vhosts/de/wo-da/prod/EAM/2_systems/Docker/StructrServer.v2.1.4/.gitignore`
- [ ] DO NOT CHECKOUT ANOTHE BRANCH before the other items are done
- [ ] switch to `prod/woda`branch

### 14.03.2024

#### current branch

- sprint29

```
 1999  git status
 2000  once docker.scenario.stop structr
 2001  cd /var/dev/EAMD.ucp/Scenarios/de/1blu/v60211/vhosts/de/wo-da/prod

 2004  cd EAM/2_systems/Docker/StructrServer.v2.1.4

 2006  cd Workspaces/
 2009  cd Workspaces/structrAppWorkspace/
 2010  ll
 2011  mv WODA-current/ WODA-old

 2029  cd /var/dev/EAMD.ucp/Scenarios/de/1blu/v60211/vhosts/de/wo-da/EAM/1_infrastructure/Once/latestServer
 2030  ll
 2031  docker ps
 2032  once docker.scenario.list
 2033  once docker.scenario.status nginx
 2034  once docker.scenario.stop nginx
 2035  once docker.scenario.create nginx wo-da.de
```

### 24.01.2024

#### current branch

- sprint29

```
/var/dev/EAMD.ucp > git status
On branch sprint29
Your branch is up to date with 'test/sprint29'.

once docker.scenario.stop structr
once docker.scenario.create structr
```

Status: up and running well

### 23.10.2023

#### current branch

- sprint29
  - git checkout -t dev/220
    - structr DB broken
      - /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/2\_systems/Docker/StructrServer.v2.1.4/Workspaces/structrAppWorkspace/WODA-current/db/neostore
    - structr DB restored from /var/backup

#### branches before update

-   master
- prod/WODA
- \* sprint29
- test/once.sh
- test/optionalChainingFree
- test/sprint28
- test/sprint29

#### branch before update

- origin/origin/feature/neom/html-views-merged
  - Your branch is ahead of 'origin/origin/feature/neom/html-views-merged' by 15 commits.
  - before certificate renewal
- renewal
  - On branch origin/feature/neom/html-views-merged

```
On branch origin/feature/neom/html-views-merged
Your branch is ahead of 'origin/origin/feature/neom/html-views-merged' by 15 commits.
  (use "git push" to publish your local commits)

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/CertBot.v1.7.0/config/conf/archive/test.wo-da.de/cert1.pem
        modified:   Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/CertBot.v1.7.0/config/conf/archive/test.wo-da.de/fullchain1.pem
        modified:   Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/CertBot.v1.7.0/config/conf/archive/test.wo-da.de/privkey1.pem
        modified:   Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Once/latestServer/.once
        deleted:    Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/2_systems/Docker/StructrServer.v2.1.4/.gitignore

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        NEOM/delivery-update
        Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/CertBot.v1.7.0/config/conf/csr/0004_csr-certbot.pem
        Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/1_infrastructure/Docker/CertBot.v1.7.0/config/conf/keys/0004_key-certbot.pem
        Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/2_systems/Docker/StructrServer.v2.1.4/Workspaces/
        Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/2_systems/Docker/StructrServer.v2.1.4/structr.zip
```

- cont…
  - git stash
    - list
      - stash@{0}: WIP on html-views-merged: 28d990b78 Merge remote-tracking branch 'origin/dev/neom-acceptance-fixes' into origin/feature/neom/html-views-merged
    - clear