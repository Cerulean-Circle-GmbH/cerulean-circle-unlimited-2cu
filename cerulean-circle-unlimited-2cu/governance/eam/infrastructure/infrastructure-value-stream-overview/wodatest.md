# WODA.test

[http://test.wo-da.de](http://test.wo-da.de)

- [next certificate change Saturday 5 July 2025 at 11:22:05 Tuesday, May 06, 2025 at 8:38:58 AM Thursday, 13 June 2024 at 11:40:32 Monday, September 16, 2024 at 8:38:58 AM](#next-certificate-change-saturday-5-july-2025-at-112205-tuesday-may-06-2025-at-83858-am-thursday-13-june-2024-at-114032-monday-september-16-2024-at-83858-am)
- [06.05.2025](#06052025)
  - [current branch](#current-branch)
- [14.03.2024](#14032024)
- [24.01.2024](#24012024)
- [16.03.2023](#16032023)
  - [current branch](#current-branch)
  - [branches before update](#branches-before-update)
  - [branch before update](#branch-before-update)

### next certificate change  
Saturday 5 July 2025 at 11:22:05  
Tuesday, May 06, 2025 at 8:38:58 AM  
Thursday, 13 June 2024 at 11:40:32  
Monday, September 16, 2024 at 8:38:58 AM

### 06.05.2025

#### current branch

- origin/test/WODA242
  - merged from
```
tmp/certUpdate160324
```
  - history
```
once docker.scenario.stop certbot
once docker.scenario.stop structr
cd /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/2_systems/Docker/StructrServer.v2.1.
4/Workspaces/structrAppWorkspace
mv WODA-current /var/backups/WODA.current.date
once docker.scenario.create certbot test.wo-da.de
once docker.scenario.create structr test.wo-da.de # killed DB again!!!!
[oosh backup.sfsre.com] root@v35469:/var/backups/structr > backup-structr-2024-01-27-01_19_WODA-current.tar.gz
# jenkins updates are down
once docker.scenario.start structr test.wo-da.de
```

### 14.03.2024

### 24.01.2024

- dev/220

### 16.03.2023

#### current branch

- dev/220
  - git checkout -t dev/220
    - structr DB broken
      - /var/dev/EAMD.ucp/Scenarios/de/1blu/v36421/vhosts/de/wo-da/test/EAM/2\_systems/Docker/StructrServer.v2.1.4/Workspaces/structrAppWorkspace/WODA-current/db/neostore
    - structr DB restored from /var/backup

#### branches before update

- feature/neom/demo\_preparation\_transient
- main/snet-beta master
- origin/feature/neom/html-views-merged
- test/neom

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