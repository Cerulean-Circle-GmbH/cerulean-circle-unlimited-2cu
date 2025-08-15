[📁 Infrastructure Value Stream Overview GitHub](/cerulean-circle-unlimited-2cu/governance/eam/infrastructure/infrastructure-value-stream-overview.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/governance/eam/infrastructure/infrastructure-value-stream-overview/sfs-re-it.md) | [🌐 Index Structure local SymLink](./sfs-re-it.entry.md)

# SFS-RE-IT

- [Domains](#domains)
- [Plesk](#plesk)
  - [Nginx.conf](#nginxconf)
- [Domains](#domains)
  - [http://sfsre.de](#httpsfsrede)
  - [Wordpress](#wordpress)
- [Plesk Docker](#plesk-docker)
  - [box.sfsre.de](#boxsfsrede)

- [Backup](#SFS-RE-IT-Backup)

  - [Server](#server)

  - [crontab](#crontab)

    - [SFS-RE](#sfs-re)

  - [Folder](#folder)

    - [SFS-RE](#sfs-re)

    - [scripts](#scripts)

    - [backup.sfsre.com](#backupsfsrecom)

    - [scripts](#scripts)
- [History](#SFS-RE-IT-History)

> [!CAUTION]
> PLESK currently destroyed !!!!

```
Nextcloud file location: 
/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache
```

## Domains

```
195.90.210.123       sfsre.de

ssh SFS-RE 
Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 4.15.0 x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Last login: Thu Jan 20 09:24:13 2022 from 89.247.163.115

This server is powered by Plesk. Log in by browsing
https://195.90.210.123:8443/ or https://v76075.1blu.de:8443/

You can log in as user 'root' or 'admin'. To log in as 'admin', use the 'plesk login' command.
Use the 'plesk' command to manage the server. Run 'plesk help' for more info.


```

## Plesk

Proxy does the https

| **DNS** | **IP4** |     |
| --- | --- | --- |
| `box.sfsre.de` [https:/box.sfsre.de/](https://box.sfsre.de/) | [http://195.90.210.123:8081/](http://195.90.210.123:8081/) | live<br><br>`box.sfsre.de: /var/lib/docker/volumes/apache_nextcloud/_data/data`<br><br>copies<br><br>`box.sfsre.de: /var/www/vhosts/sfsre.de/box.sfsre.de/data`<br><br>chrontab -e<br><br>`haparo.de: rsync -avzhe ssh sfsre:/var/lib/docker/volumes/apache_* /root/sfsre_nextcloud/`<br><br>`haparo.de: rsync -avzhe ssh sfsre:/var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache /root/sfsre_db/`<br><br>original in docker volume<br><br>`/var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/docker-compose.yml`<br><br>`volumes:`<br><br>  `db:`<br><br>  `nextcloud:`<br><br>  `# certs:` done by plesk<br><br>  `vhost.d:`<br><br>  `html:`<br><br>physically in<br><br>`/var/lib/docker/volumes`<br><br>chrontab |
| `www.sfsre.de` [https://www.sfsre.de/](https://www.sfsre.de/) | [http://195.90.210.123:8081/](http://195.90.210.123:8081/) |     |

### Nginx.conf

```
cd /var/www/vhosts/system/box.sfsre.de/conf
nginx.conf

gets automatically copied to
vhost_nginx.conf

New configuration files for the Apache web server were not created due to the errors in configuration templates: 
nginx: [emerg] "server" directive is not allowed here in /var/www/vhosts/system/box.sfsre.de/conf/vhost_nginx.conf:6 nginx: configuration file /etc/nginx/nginx.conf test failed . 
Detailed error descriptions were sent to you by email. 
Please resolve the issues and click here to generate broken configuration files once again or here to generate all configuration files. See the details in Configuration Troubleshooter


```

## Domains

![](./attachments/image-20220311-104635.png)

### [http://sfsre.de](http://sfsre.de)

![](./attachments/image-20220311-105332.png)

### Wordpress

[https://www.sfsre.de/wp-login.php](https://www.sfsre.de/wp-login.php)

![](./attachments/image-20220311-104418.png)

## Plesk Docker

![](./attachments/image-20220311-104508.png)

### [box.sfsre.de](http://box.haparo.com)

```
Nextcloud Docker file location: 
/var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache
```

# Backup

The backups are still very manual and error prone.  
A recovery was never tried.

## Server

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

Server list SSH

```
Host SFS-RE
 User root
 Port 22
 HostName 195.90.210.123
 IdentityFile ~/.ssh/id_rsa
 
Host backup.sfsre.com
 # wrong ssh config name: SFS-RE.com
 # ex ssh config: haparo
 User root
 Port 22
 HostName 178.254.33.66
 IdentityFile ~/.ssh/id_rsa
```

## crontab

### SFS-RE

```
MAILTO=""
30      22      *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/catalog/scripts/update-index.php'
29      *       *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/wp-toolkit/scripts/maintenance.php'
35      2       *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/wp-toolkit/scripts/instances-auto-update.php'
56      18      *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/advisor/scripts/update-config.php'
41      *       *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/letsencrypt/scripts/keep-secured.php'
55      3       *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/xovi/scripts/analyze-logs.php'
0       0       *       *       0       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/xovi/scripts/clear-cache.php'
6       19      *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/notifier/scripts/check-compatible-tls.php'
24      9       *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/notifier/scripts/check-mail-ports.php'
0       0       *       *       0       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/letsencrypt/scripts/remove-expired-tokens.php'
6       1       *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/pagespeed-insights/scripts/update-cache.php'
0       0       *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/advisor/scripts/update-cache.php'
34      23      *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/xovi/scripts/siteaudit-rescan.php'
30      1       *       *       */1     /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/dbdump
*/5     *       *       *       *       /root/serverstatus
42      0       26      *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/revisium-antivirus/scripts/periodic-scan.php'
0       5       *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/revisium-antivirus/scripts/cleanup.php'
27      22      */2     *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/revisium-antivirus/scripts/tools_update.php'
2,17,32,47      *       *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/revisium-antivirus/scripts/ra_executor_run.php'
27      8       *       *       2       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/revisium-antivirus/scripts/send_stats.php'
MAILTO=""
26,59   *       *       *       *       /opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/xovi/scripts/seo-kpi.php'
```

important

```
/var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/dbdump
```

changed to

[https://crontab.guru/#30\_1\_\*\_\*\_\*/1](https://crontab.guru/#30_1_*_*_*/1)

*“At 01:30 on every day-of-week.”*

```
30 1 * * */1
```

backup.sfsre.com

```
MAILTO=""
30	22	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/catalog/scripts/update-index.php'
29	*	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/wp-toolkit/scripts/maintenance.php'
35	2	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/wp-toolkit/scripts/instances-auto-update.php'
56	18	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/advisor/scripts/update-config.php'
41	*	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/letsencrypt/scripts/keep-secured.php'
55	3	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/xovi/scripts/analyze-logs.php'
0	0	*	*	0	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/xovi/scripts/clear-cache.php'
6	19	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/notifier/scripts/check-compatible-tls.php'
24	9	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/notifier/scripts/check-mail-ports.php'
0	0	*	*	0	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/letsencrypt/scripts/remove-expired-tokens.php'
6	1	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/pagespeed-insights/scripts/update-cache.php'
0	0	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/advisor/scripts/update-cache.php'
30	1	*	*	*/1	rsync -avzhe ssh sfsre:/var/lib/docker/volumes/apache_* /root/sfsre_nextcloud/
30	1	*	*	*/1	rsync -avzhe ssh sfsre:/var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache /root/sfsre_db/
14	18	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/xovi/scripts/siteaudit-rescan.php'
42	4	26	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/revisium-antivirus/scripts/periodic-scan.php'
0	5	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/revisium-antivirus/scripts/cleanup.php'
26	23	*/2	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/revisium-antivirus/scripts/tools_update.php'
14,29,44,59	*	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/revisium-antivirus/scripts/ra_executor_run.php'
4	8	*	*	2	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/revisium-antivirus/scripts/send_stats.php'
MAILTO=""
0,30	*	*	*	*	/opt/psa/admin/bin/php -dauto_prepend_file=sdk.php '/opt/psa/admin/plib/modules/xovi/scripts/seo-kpi.php'
```

important

```
rsync -avzhe ssh sfsre:/var/lib/docker/volumes/apache_* /root/sfsre_nextcloud/
rsync -avzhe ssh sfsre:/var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache /root/sfsre_db/
```

## Folder

### SFS-RE

```
cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db

/var/lib/docker/volumes/apache_*
/var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache

nextcloud:/var/www/html
```

manual backup: 03.01.2023

```
/var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/manual.backup.sfsre_db.20230103
```

### scripts

/var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/dbdump

```
#!/bin/bash
docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/db-$(date +"%Y_%m_%d_%I_%M_%p").sql
```

### backup.sfsre.com

```

/root/sfsre_nextcloud/
/root/sfsre_db/
```

### scripts

/root/clean.sh

```
#!/bin/bash

cd /var/lib/psa/dumps/domains/sfsre.de
ll
rm backup_*

ll

```

# History

![](https://2cu.atlassian.net/wiki/images/icons/grey_arrow_down.png)

history

```
 1003  df -h
 1004  cd ..
 1005  du -h --max-depth=1 ./
 1006  exit
 1007  df -h
 1008  du -h --max-depth=1 ./
 1009  cd
 1010  cd /
 1011  du -h --max-depth=1 ./
 1012  ll
 1013  cd /var/
 1014  ll
 1015  du -h --max-depth=1 ./
 1016  cd www/vhosts/
 1017  du -h --max-depth=1 ./
 1018  cd sfsre.de/
 1019  du -h --max-depth=1 ./
 1020  pwd
 1021  cd /var/lib/psa/
 1022  cd dumps/domains/sfsre.de/
 1023  pwd
 1024  df -h
 1025  ll
 1026  rm backup_*
 1027  ll
 1028  df -h
 1029  exit
 1030  df -h
 1031  cd /var/lib/psa/
 1032  cd dumps/domains/sfsre.de/
 1033  ll
 1034  pwd
 1035  cd
 1036  ll
 1037  clean.sh
 1038  vim clean.sh
 1039  chmod + ./clean.sh 
 1040  chmod +x ./clean.sh 
 1041  ./clean.sh 
 1042  cat clean.sh 
 1043  cd /var/lib/psa/dumps/domains/sfsre.de
 1044  ll
 1045  df -h
 1046  du -h --max-depth=1 ./
 1047  cd /var/backups/
 1048  du -h --max-depth=1 ./
 1049  cd ..
 1050  du -h --max-depth=1 ./
 1051  cd www/
 1052  du -h --max-depth=1 ./
 1053  cd vhosts/sfsre.de/
 1054  du -h --max-depth=1 ./
 1055  cd VEEAM/
 1056  exit
 1057  veeamconfig repository list
 1058  plesk login
 1059  df -h
 1060  plesk login
 1061  docker ps
 1062  df -h
 1063  cd /var/lib/psa/dumps/domains/sfsre.de
 1064  ll
 1065  rm -r backup_*
 1066  df -h
 1067  cd /var/www/vhosts/sfsre.de/VEEAM/
 1068  ll
 1069  du -h --max-depth=1 ./
 1070  cd For_TEMP_Backup/
 1071  ll
 1072  du -h --max-depth=1 ./
 1073  Backup\ Job\ SFSRESRV001/
 1074  du -h --max-depth=1 ./
 1075  cd Backup\ Job\ SFSRESRV001/
 1076  du -h --max-depth=1 ./
 1077  ll
 1078  rm Backup\ Job\ SFSRESRV001*
 1079  docker ps
 1080  ll
 1081  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1082  ll
 1083  docker-compose up
 1084  plesk login
 1085  docker ps
 1086  docker exec -u 0 -it apache_app_1 bash
 1087  df -h
 1088  cd /var/www/vhosts/sfsre.de/VEEAM/
 1089  ll
 1090  du -h --max-depth=1 ./
 1091  cd For_TEMP_Backup/
 1092  ll
 1093  du -h --max-depth=1 ./
 1094  cd VeeamConfigBackup/
 1095  ll
 1096  cd SFSREMGMT/
 1097  ll
 1098  du -h --max-depth=1 ./
 1099  cd ..
 1100  ll
 1101  cd ..
 1102  du -h --max-depth=1 ./
 1103  cd Backup\ Job\ SFSRECheckMK
 1104  ll
 1105  rm Backup\ Job\ SFSRECheckMK2021-09*
 1106  rm Backup\ Job\ SFSRECheckMKD2021-09*
 1107  rm Backup\ Job\ SFSRECheckMKD2021-08*
 1108  ll
 1109  rm Backup\ Job\ SFSRECheckMKD2021-07
 1110  rm Backup\ Job\ SFSRECheckMKD2021-07*
 1111  ll
 1112  du -h --max-depth=1 ./
 1113  cd ..
 1114  ll
 1115  cd Backup\ Job\ SFSRESRV001/
 1116  ll
 1117  du -h --max-depth=1 ./
 1118  cd ..
 1119  df -h
 1120  du -h --max-depth=1 ./
 1121  exit
 1122  cd /var/www/vhosts/sfsre.de/VEEAM/
 1123  ll
 1124  du -h --max-depth=1 ./
 1125  cd /var/lib/psa/dumps/domains/sfsre.de
 1126  ll
 1127  du -h --max-depth=1 ./
 1128  cd /var/logs
 1129  cd /var/log
 1130  ll
 1131  cat auth.log
 1132  less auth.log
 1133  cat auth.log
 1134  du -h --max-depth=1 ./
 1135  cd journal/
 1136  du -h --max-depth=1 ./
 1137  ll
 1138  cd 5a45a8fb10c546a3ba8c6772abd7230f/
 1139  ll
 1140  du -h --max-depth=1 ./
 1141  cd ..
 1142  du -h --max-depth=1 ./
 1143  ll
 1144  cat syslog
 1145  exit
 1146  mc
 1147  cd /var/dev/EAMD.ucp/
 1148  ll
 1149  git status
 1150  git pull
 1151  git checkout -t origin/temp/ShifterNetwork-4.3.0
 1152  once v
 1153  git pull
 1154  once links.fix
 1155  once v
 1156  once links.fix
 1157  ps -edalf
 1158  ps -edalf | grep vee
 1159  ps -edalf | grep ve
 1160  docker ps
 1161  exit
 1162  ll
 1163  history | less
 1164  cat history.20210804.txt | less
 1165  ll
 1166  cat history.20210804.txt | less
 1167  df -h
 1168  cd /var/lib/psa/dumps/domains/sfsre.de
 1169  ll
 1170  du -h --max-depth=1 ./
 1171  cd /var/www/vhosts/sfsre.de/VEEAM/
 1172  ll
 1173  du -h --max-depth=1 ./
 1174  cd For_TEMP_Backup/
 1175  ll
 1176  cd Backup\ Job\ SFSRESRV001/
 1177  ll
 1178  cd ../../
 1179  ll
 1180  cd ..
 1181  ll
 1182  rm -r VEEAM/
 1183  df -h
 1184  exit
 1185  df -h
 1186  exit
 1187  docker ps
 1188  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1189  ll
 1190  docker-compose up
 1191  docker ps
 1192  docker-compose up
 1193  df  -h
 1194  docker-compose up
 1195  docker-compose up
 1196  docker ps
 1197  docker-compose up
 1198  df -h
 1199  apt update
 1200  docker-compose up
 1201  docker ps
 1202  ifconfig
 1203  docker ps
 1204  plesk login
 1205  docker ps
 1206  df -h
 1207  exit
 1208  docker ps
 1209  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1210  ll
 1211  docker-compose up
 1212  docker ps
 1213  docker-compose ps
 1214  docker-compose up
 1215  docker-compose down
 1216  docker-compose up
 1217  docker-compose ps
 1218  docker-compose up
 1219  plesk login
 1220  exit
 1221  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1222  docker-compose ps
 1223  docker-compose up
 1224  docker ps
 1225  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1226  docker-compose up
 1227  docker ps
 1228  exit
 1229  docker ps
 1230  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1231  docker-compose  up
 1232  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1233  docker-compose up
 1234  plesk login
 1235  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1236  docker ps
 1237  cat your_dump.sql | docker exec -i apache_db_1 psql -U postgres
 1238  cat docker-compose.yml 
 1239  ll
 1240  cat db.env 
 1241  cat your_dump.sql | docker exec -i apache_db_1 psql -U nextcloud
 1242  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > db.sql
 1243  ll
 1244  exit
 1245  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1246  ll
 1247  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > pdb.sql
 1248  ll
 1249  cat docker-compose.yml 
 1250  cd /var/lib/docker/volumes/apache_nextcloud/
 1251  ll
 1252  cd _data/
 1253  ll
 1254  cd ..
 1255  ll
 1256  cd apache_db/
 1257  ll
 1258  cd _data/
 1259  ll
 1260  cd ..
 1261  cd
 1262  ll
 1263  mkdir -p nextcloud_bkp
 1264  ll
 1265  cp -r /var/lib/docker/volumes/apache_db/ ./nextcloud_bkp/
 1266  cp -r /var/lib/docker/volumes/apache_nextcloud/ ./nextcloud_bkp/
 1267  ll
 1268  df -h
 1269  cd nextcloud_bkp/
 1270  ll
 1271  du -h --max-depth=1 ./
 1272  ssh woda.prod
 1273  cat ~./ssh/config
 1274  cd ~/.ssh/
 1275  ll
 1276  ifconfig
 1277  cat config
 1278  ll
 1279  cd ..
 1280  ll
 1281  cd nextcloud_bkp/
 1282  ll
 1283  pwd
 1284  cd /var/lib/docker/volumes/
 1285  ll
 1286  cd
 1287  ll
 1288  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1289  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > db.sql
 1290  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1291  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > db.sql
 1292  ll
 1293  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > db.sql
 1294  ll
 1295  $date
 1296  echo $date
 1297  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > db-"$(date +"%Y_%m_%d_%I_%M_%p").sql
 1298  ;
 1299  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > db-"$(date +"%Y_%m_%d_%I_%M_%p").sql
 1300  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > db-$(date +"%Y_%m_%d_%I_%M_%p").sql
 1301  ll
 1302  crontab -e
 1303  mkdir -p db
 1304  cd pwd
 1305  cd db/
 1306  pwd
 1307  crontab -e
 1308  pwd
 1309  crontab -e
 1310  ll
 1311  l
 1312  ll
 1313  cd ..
 1314  pwd
 1315  ll
 1316  cd db/
 1317  ll
 1318  crontab -e
 1319  ll
 1320  crontab -e
 1321  ll
 1322  docker ps
 1323  ll
 1324  crontab -e
 1325  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/db-$(date +"%Y_%m_%d_%I_%M_%p").sql
 1326  ll
 1327  crontab -e
 1328  ll
 1329  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1330  ll
 1331  cd db/
 1332  ll
 1333  crontab -e
 1334  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/
 1335  ll
 1336  crontab -e
 1337  ll
 1338  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/db-$(date +"%Y_%m_%d_%I_%M_%p").sql
 1339  ll
 1340  vim dbdump
 1341  chmod +x ./dbdump 
 1342  ./dbdump 
 1343  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db
 1344  ll
 1345  crontab -e
 1346  ll
 1347  crontab -e
 1348  ll
 1349  crontab -e
 1350  ll
 1351  exit
 1352  docker ps
 1353  ll
 1354  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db
 1355  cd ..
 1356  docker-compose up
 1357  docker ps
 1358  cd /var/www/vhosts/sfsre.de/box.sfsre.de/
 1359  ll
 1360  mkdir -p bkp
 1361  mv css/ bkp/
 1362  mv favicon.ico bkp/
 1363  mv img/ bkp/
 1364  mv index.html bkp/
 1365  mv test/ bkp/
 1366  ll
 1367  cp -r /var/lib/docker/volumes/apache_nextcloud/ /var/www/vhosts/sfsre.de/box.sfsre.de
 1368  ll
 1369  cp -r /var/lib/docker/volumes/apache_nextcloud/* /var/www/vhosts/sfsre.de/box.sfsre.de
 1370  ll
 1371  rm -r _data/
 1372  ll
 1373  rm -r apache_nextcloud/
 1374  ll
 1375  cp -r /var/lib/docker/volumes/apache_nextcloud/_data/ /var/www/vhosts/sfsre.de/box.sfsre.de
 1376  ll
 1377  rm -r _data/
 1378  cp -r /var/lib/docker/volumes/apache_nextcloud/_data/* /var/www/vhosts/sfsre.de/box.sfsre.de
 1379  ll
 1380  cd ..
 1381  ll
 1382  cd ..
 1383  ll
 1384  cd system/box.sfsre.de/conf/
 1385  ll
 1386  cat nginx.conf
 1387  sudo nano nginx.conf
 1388  sudo vim nginx.conf
 1389  plesk login
 1390  apt update
 1391  sudo vim /etc/apt/sources.list
 1392  sudo vim /etc/apt/sources.list.d/plesk-ext-docker.list
 1393  apt update
 1394  sudo apt upgrade
 1395  php -v
 1396  cd /var/www/vhosts/sfsre.de/box.sfsre.de/
 1397  cd config/
 1398  ll
 1399  vim config.php 
 1400  docker ps
 1401  docker inspect apache_db_1
 1402  vim config.php 
 1403  ll
 1404  cd ..
 1405  ll
 1406  cd data/
 1407  ll
 1408  cat nextcloud.log 
 1409  tail -f nextcloud.log 
 1410  docker ps
 1411  docker inspect apache_db_1
 1412  cd ..
 1413  cd config/
 1414  vim config.php 
 1415  ll
 1416  docker inspect apache_db_1
 1417  vim config.php 
 1418  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache
 1419  ll
 1420  docker-compose up
 1421  docker-compose down
 1422  docker-compose up
 1423  docker ps
 1424  docker-compose up
 1425  PostgreSQL -v
 1426  postgres -V
 1427  sudo -u postgres psql
 1428  cd db
 1429  ll
 1430  psql -d nextcloud -U nextcloud -f db-2022_03_11_12_45_AM.sql 
 1431  psql -h localhost -d nextcloud -U nextcloud -f db-2022_03_11_12_45_AM.sql 
 1432  sudo -u postgres psql
 1433  psql -h localhost -d nextcloud -U nextcloud -f db-2022_03_11_12_45_AM.sql 
 1434  sudo -u postgres psql
 1435  psql -h localhost -d nextcloud -U nextcloud -f db-2022_03_11_12_45_AM.sql 
 1436  psql  nextcloud < db-2022_03_11_12_45_AM.sql 
 1437  sudo - postgres psql nextcloud < db-2022_03_11_12_45_AM.sql 
 1438  sudo -u postgres psql nextcloud < db-2022_03_11_12_45_AM.sql 
 1439  docker ps
 1440  cd ..
 1441  docker ps
 1442  cd /var/www/vhosts/system/box.sfsre.de/
 1443  cd conf/
 1444  ll
 1445  sudo vim nginx.conf
 1446  ll
 1447  plesk login
 1448  ll
 1449  ll
 1450  docker ps
 1451  history
 1452  cd/var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/
 1453  ll
 1454  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/
 1455  ll
 1456  cd ..
 1457  ll
 1458  cd docker/
 1459  ll
 1460  cat docker-compose.yml 
 1461  cd ..
 1462  ll
 1463  cd with-nginx-proxy/postgres/
 1464  ll
 1465  cd apache/
 1466  ll
 1467  cd proxy/
 1468  ll
 1469  cat Dockerfile 
 1470  cat uploadsize.conf 
 1471  cd ..
 1472  ll
 1473  mc
 1474  apt0get install mc
 1475  apt-get install mc
 1476  mc
 1477  plsek -login
 1478  plesk -login
 1479  plesk login
 1480  ping http://www.sfsre.com/
 1481  ping www.sfsre.com
 1482  nslookup boxes.sfsre.de
 1483  nslookup box.sfsre.de
 1484  ll
 1485  cd /var/www/vhosts/
 1486  ll
 1487  cd system/
 1488  ll
 1489  cd box.sfsre.de/
 1490  ll
 1491  cd conf/
 1492  ll
 1493  mc
 1494  plesk login
 1495  ll
 1496  cd ..
 1497  ll
 1498  cd ..
 1499  ll
 1500  cd box.sfsre.de/
 1501  ll
 1502  cd data/
 1503  ll
 1504  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/
 1505  ll
 1506  cd postgres/
 1507  ll
 1508  cd apache/
 1509  ll
 1510  mc
 1511  plesk login
 1512  docker ps
 1513  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache
 1514  docker-compose up
 1515  cd /var/www/vhosts/system/box.sfsre.de/conf/
 1516  ll
 1517  cat vhost_nginx.conf 
 1518  ll
 1519  sudo nginx -t
 1520  cd 
 1521  cd /var/www/vhosts/system/sfsre.de/conf/
 1522  ll
 1523  cat nginx.conf
 1524  cd ..
 1525  ll
 1526  cd ..
 1527  cd sfsre.de/
 1528  ll
 1529  cd box.sfsre.de/
 1530  ll
 1531  cd ..
 1532  ll
 1533  cd ..
 1534  ll
 1535  cs system/box.sfsre.de/
 1536  cd system/box.sfsre.de/
 1537  ll
 1538  cd conf/
 1539  ll
 1540  cat vhost_nginx.conf 
 1541  cd /etc/nginx/conf.d/
 1542  ll
 1543  cd ..
 1544  ll
 1545  cat nginx.conf
 1546  cd modules.available.d/
 1547  ll
 1548  cd ..
 1549  cd modules.conf.d/
 1550  ll
 1551  cd ..
 1552  ll
 1553  cd plesk.conf.d/
 1554  ll
 1555  cd /var/www/vhosts/system/box.sfsre.de/conf/
 1556  ll
 1557  cat nginx.conf
 1558  cat vhost_nginx.conf 
 1559  plesk login
 1560  ll
 1561  cp vhost_nginx.conf vhost_nginx.conf.bkp
 1562  ll
 1563  cat /etc/httpd/conf/plesk.conf.d/server.conf
 1564  cd /etc/httpd/conf/plesk.conf.d
 1565  cd /etc/nginx/conf/plesk.conf.d
 1566  cd /etc/nginx/plesk.conf.d/
 1567  ll
 1568  cat server.conf
 1569  psql -d nextcloud -U nextcloud -f db-2022_03_11_12_45_AM.sql 
 1570  psql -h localhost -d nextcloud -U nextcloud -f db-2022_03_11_12_45_AM.sql 
 1571  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/
 1572  psql -h localhost -d nextcloud -U nextcloud -f db-2022_03_11_12_45_AM.sql 
 1573  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db
 1574  psql -h localhost -d nextcloud -U nextcloud -f db-2022_03_11_12_45_AM.sql nextcloud 
 1575  sudo -u postgre psql
 1576  sudo -u postgres psql
 1577  psql -h localhost -d nextcloud -U nextc
 1578  psql -h localhost -d nextcloud -U nextcloud -f db-2022_03_11_12_45_AM.sql
 1579  sudo -u postgres psql
 1580  psql -h localhost -d nextcloud -U nextcloud -f db-2022_03_11_12_45_AM.sql
 1581  plesk login
 1582  systemctl enable nginx
 1583  service nginx status
 1584  cd /var/www/vhosts/system/box.sfsre.de/conf/
 1585  ll
 1586  cat nginx.conf
 1587  cat vhost_nginx.conf
 1588  clear
 1589  cat vhost_nginx.conf
 1590  sudo nginx -T
 1591  sudo nginx -t
 1592  sudo nginx -T
 1593  sudo nginx -t
 1594  cat nginx.conf
 1595  ll
 1596  mv vhost_nginx.conf vhost_nginx.conf2
 1597  mv vhost_nginx.conf2 vhost_nginx.conf
 1598  ll
 1599  cat vhost_nginx.conf
 1600  ll
 1601  vim nginx.conf
 1602  cat vhost_nginx.conf
 1603  clear
 1604  cat vhost_nginx.conf
 1605  vim nginx.conf
 1606  cd /etc/apache2/sites-available/
 1607  ll
 1608  cat 000-default.conf 
 1609  ll
 1610  docker ps
 1611  plesk login
 1612  mc
 1613  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache
 1614  mc
 1615  cat docker-compose.yml 
 1616  cd /var/lib/docker/volumes/
 1617  ll
 1618  docker volumes ls
 1619  docker volumes list
 1620  docker volume list
 1621  cd apache_nextcloud/
 1622  ll
 1623  cd _data/
 1624  ll
 1625  cd data/marcel/
 1626  ll
 1627  cd files
 1628  ll
 1629  crontab 
 1630  crontab -e
 1631  nslookup boxes.sfsre.de
 1632  plsek login
 1633  plesk login
 1634  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/
 1635  ll
 1636  rm db-2022_03_10_*
 1637  rm db-2022_03_11_*
 1638  ll
 1639  rm db-2022_03_09_*
 1640  ll
 1641  exit
 1642  sudo systemctl status postgresql
 1643  sudo pg_isready
 1644  sudo vim /etc/postgresql/10/main/pg_hba.conf 
 1645  sudo systemctl restart postgresql
 1646  curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
 1647  sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
 1648  sudo apt install pgadmin4
 1649  sudo vim /usr/pgadmin4/bin/setup-web.sh 
 1650  sudo /usr/pgadmin4/bin/setup-web.sh 
 1651  docker ps
 1652  docker inspect apache_db_1
 1653  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/
 1654  ll
 1655  pwd
 1656  cd /var/lib/pgadmin/storage/shantanusk_hotmail.com/
 1657  ll
 1658  cp /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/1 9/with-nginx-proxy/postgres/apache/db/db-2022_03_13_12_45_AM.sql ./
 1659  cp /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/1 9/with-nginx-proxy/postgres/apache/db/db-2022_03_13_12_45_AM.sql /var/lib/pgadmin/storage/shantanusk_hotmail.com
 1660  cp /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/db-2022_03_13_12_45_AM.sql /var/lib/pgadmin/storage/shantanusk_hotmail.com
 1661  ll
 1662  rm db-2022_03_13_12_45_AM.sql 
 1663  ll
 1664  docker ps
 1665  crontab -e
 1666  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/1 9/with-nginx-proxy/postgres/apache/
 1667  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1668  ll
 1669  cd db/
 1670  cat dbdump 
 1671  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/temp.sql
 1672  ll
 1673  rm temp.sql 
 1674  docker exec -t apache_db_1 pg_dumpall -c -U postgresql > /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/temp.sql
 1675  ll
 1676  cat temp.sql 
 1677  docker exec -t apache_db_1 pg_dumpall -c -U nextcloud > /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/temp.sql
 1678  sudo service postgres status
 1679  sudo systemctl status postgresql
 1680  sudo systemctl stop postgresql
 1681  docker ps
 1682  docker inspect apache_db_1
 1683  docker ps
 1684  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db
 1685  ll
 1686  cd ..
 1687  cat docker-compose.yml 
 1688  cat db.
 1689  cat db.env
 1690  docker ps
 1691  docker inspect 4c7fd1c03b56  | grep IPAddress.
 1692  sudo systemctl status postgresql
 1693  sudo systemctl start postgresql
 1694  cd /var/www/vhosts/sfsre.de/box.sfsre.de/
 1695  ll
 1696  rm -r 3rdparty/ apps/ config/ core/ custom_apps/ data/ lib/ ocm-provider/ ocs/ ocs-provider/ resources/ themes/
 1697  ll
 1698  rm AUTHORS COPYING console.php cron.php index.html index.php occ public.php remote.php robots.txt status.php version.php 
 1699  ll
 1700  cd ..
 1701  cd system/box.sfsre.de/conf/
 1702  ll
 1703  rm vhost_nginx.conf
 1704  ll
 1705  sudo vim nginx.conf
 1706  cat vhost_nginx.conf.bkp 
 1707  sudo vim nginx.conf
 1708  sudo systemctl restart nginx
 1709  sudo nginx -t
 1710  sudo vim nginx.conf
 1711  plesk login
 1712  cd ../..
 1713  cd ..
 1714  cd sfsre.de/box.sfsre.de/
 1715  ll
 1716  cp -r /var/lib/docker/volumes/apache_nextcloud/_data/ /var/www/vhosts/sfsre.de/box.sfsre.de/
 1717  ll
 1718  rm -r _data/
 1719  cp -r /var/lib/docker/volumes/apache_nextcloud/_data/* /var/www/vhosts/sfsre.de/box.sfsre.de/
 1720  ll
 1721  vim config/config.php 
 1722  sudo systemctl stop postgres
 1723  sudo systemctl status postgres
 1724  sudo systemctl status postgresql
 1725  sudo systemctl stop postgresql
 1726  sudo systemctl status postgresql
 1727  vim config/config.php 
 1728  ll
 1729  sudo systemctl status postgresql
 1730  docker ps
 1731  docker exec -it 4c7fd1c03b56 bash
 1732  sudo systemctl start postgresql
 1733  sudo systemctl status postgresql
 1734  sudo systemctl stop postgresql
 1735  sudo systemctl status postgresql
 1736  which postgresql
 1737  which postgres
 1738  postgres -v
 1739  postgresql -v
 1740  postgresql -version
 1741  sudo systemctl start postgresql
 1742  sudo systemctl start postgresql
 1743  sudo systemctl status postgresql
 1744  postgres -V
 1745  postgresql -V
 1746  psql -V
 1747  cd /var/lib/docker/volumes/apache_nextcloud/_data/
 1748  ll
 1749  sudo systemctl status postgresql
 1750  sudo nginx -t
 1751  cd /var/www/vhosts/system/woda.sfsre.de/conf/
 1752  ll
 1753  rm vhost_nginx.conf 
 1754  ll
 1755  cat nginx.conf
 1756  cd ..
 1757  cd box.sfsre.de/conf/
 1758  ll
 1759  cat nginx.conf
 1760  cd ..
 1761  ll
 1762  cd ..
 1763  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/
 1764  ll
 1765  cat docker-compose.yml 
 1766  docker ps
 1767  docker exec -it 4c7fd1c03b56 bash
 1768  ll
 1769  docker ps
 1770  cd /var/www/vhosts/sfsre.de/box.sfsre.de/
 1771  ll
 1772  vim config/config.php 
 1773  ll
 1774  cd config/
 1775  ll
 1776  cd ..
 1777  ll
 1778  sudo touch /var/log/nextcloud.log
 1779  tail -f  data/nextcloud.log 
 1780  ll
 1781  vim config/config.php 
 1782  pwd
 1783  vim config/config.php 
 1784  cat /etc/nginx/plesk.conf.d/vhosts/box.sfsre.de.conf
 1785  sudo nginx -t
 1786  tail -f /var/log/apache/access.log
 1787  tail -f /var/log/apache2/access.log
 1788  ll
 1789  sudo chmod -R ugo+rw *
 1790  sudo chown www-data:www-data -R
 1791  sudo chown www-data:www-data -R /var/www/vhosts/sfsre.de/box.sfsre.de
 1792  cd /var/www/vhosts/sfsre.de/box.sfsre.de/
 1793  ll
 1794  rm -r 3rdparty/ apps/ config/ core/ custom_apps/ data/ lib/ ocm-provider/ ocs-provider/ resources/ themes/
 1795  ll
 1796  rm AUTHORS COPYING console.php  cron.php index.html index.php occ public.php  remote.php robots.txt status.php  version.php 
 1797  ll
 1798  rm -r ocs/
 1799  ll
 1800  cp -r /var/lib/docker/volumes/apache_nextcloud/_data/* /var/www/vhosts/sfsre.de/box.sfsre.de/
 1801  ll
 1802  pwd
 1803  vim config/config.php 
 1804  cd ..
 1805  sudo chmod 755 -R ./box.sfsre.de/
 1806  sudo chmod 777 -R ./box.sfsre.de/
 1807  sudo chmod 766 -R ./box.sfsre.de/
 1808  ll
 1809  sudo chown -R sfsre
 1810  sudo chown -R sfsre box.sfsre.de/
 1811  ll
 1812  sudo chown -R sfsre:psaserv box.sfsre.de/
 1813  ll
 1814  cd ..
 1815  ll
 1816  vim sfsre.de/box.sfsre.de/config/config.php 
 1817  cd sfsre.de/
 1818  sudo chmod 755 -R ./box.sfsre.de/
 1819  sudo chmod 766 -R ./box.sfsre.de/
 1820  sudo chmod 777 -R ./box.sfsre.de/
 1821  ll
 1822  sudo chmod 775 -R ./box.sfsre.de/
 1823  sudo chmod 755 -R ./box.sfsre.de/
 1824  sudo chmod 766 -R ./box.sfsre.de/
 1825  ll
 1826  plesk repair web box.sfsre.de
 1827  ll
 1828  sudo chmod 755 -R ./box.sfsre.de/
 1829  sudo chmod 777 -R ./box.sfsre.de/
 1830  sudo chmod 775 -R ./box.sfsre.de/
 1831  sudo chmod 766 -R ./box.sfsre.de/
 1832  plesk login
 1833  docker ps
 1834  plesk login
 1835  ll
 1836  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/
 1837  ll
 1838  rm db-2022_03_14
 1839  rm db-2022_03_14*
 1840  ll
 1841  rm db-2022_03_13*
 1842  rm db-2022_03_12*
 1843  rm db-2022_03_11*
 1844  ll
 1845  rm temp.sql 
 1846  ll
 1847  docker ps
 1848  plesk login
 1849  docker ps
 1850  systemctl status nginx
 1851  nginx -t
 1852  systemctl start nginx
 1853  systemctl status nginx
 1854  tail -f /var/log/nginx/error.log
 1855  tail -f /var/log/syslog
 1856  tail -f /var/log/lastlog
 1857  tail -f /var/log/debug
 1858  /var/log/daemon.log
 1859  if [ -e /var/run/nginx.pid ]; then echo "nginx is running"; fi
 1860  ll
 1861  apt install nano
 1862  nano serverstatus
 1863  chmod +x serverstatus 
 1864  pwd
 1865  crontab -e
 1866  ll
 1867  nano serverstatus
 1868  ./serverstatus 
 1869  cat serverstatus 
 1870  nano serverstatus
 1871  docker ps
 1872  plesk login
 1873  cd /var/dev/EAMD.ucp/3rdPartyComponents/com/nextcloud/Nextcloud/19/with-nginx-proxy/postgres/apache/db/
 1874  ll
 1875  rm db-2022_03_28*
 1876  rm db-2022_03_27*
 1877  rm db-2022_03_26*
 1878  rm db-2022_03_25*
 1879  rm db-2022_03_24*
 1880  rm db-2022_03_23*
 1881  rm db-2022_03_222*
 1882  rm db-2022_03_22*
 1883  rm db-2022_03_21*
 1884  rm db-2022_03_20*
 1885  rm db-2022_03_19*
 1886  ll
 1887  rm db-2022_03_18*
 1888  rm db-2022_03_17*
 1889  rm db-2022_03_16*
 1890  rm db-2022_03_15*
 1891  ll
 1892  cd ..
 1893  ll
 1894  docker ps
 1895  ping sfsre.de
 1896  docker ps
 1897  plesk login
 1898  cd /var/www/vhosts/sfsre.de/httpdocs/
 1899  ll
 1900  pwd
 1901  ll
 1902  cat wp-settings.php 
 1903  exit
 1904  ll
 1905  echo $PATH
 1906  status
 1907  cat config/user.env 
 1908  vim config/user.env 
 1909  exit
 1910  config list
 1911  echo $PATH
 1912  path list
 1913  oosh/path lis
 1914  oosh/path list
 1915  vim config/user.env 
 1916  source $CONFIG
 1917  path list
 1918  config ssh.set.config.host SFS-RE.de
 1919  ll
 1920  sh -c "$(wget -O- https://raw.githubusercontent.com/Cerulean-Circle-GmbH/once.sh/main/init/oosh)"
 1921  this
 1922  oosh/this
 1923  exit
 1924  config help
 1925  echo $PATH
 1926  . $CONFIG
 1927  echo $PATH
 1928  l
 1929  ll
 1930  config list
 1931  config help
 1932  cd /var/dev/EAMD.ucp/
 1933  ll
 1934  git status
 1935  git branch
 1936  git checkout -t origin/test/sfsre
 1937  git branch -r | grep sfs
 1938  git branch -r 
 1939  git pull
 1940  git checkout -t origin/test/sfsre
 1941  once find
 1942  config bash.minimal.version 4
 1943  once find
 1944  once states.list 
 1945  docker
 1946  docker ps
 1947  once states.list 
 1948  once check.domain.set 
 1949  once init
 1950  once domain.set sfsre.de
 1951  once scenario.check 
 1952  once domain.discover 
 1953  once scenario.check 
 1954  once states.list 
 1955  once start
 1956  once log
 1957  cd
 1958  ll
 1959  cat .once 
 1960  echo $PATH
 1961  rm .once 
 1962  once fing
 1963  once find
 1964  once init
 1965  rm .once 
 1966  once init
 1967  vim .once 
 1968  once status
 1969  once find
 1970  once start
 1971  vim .once 
 1972  vim /var/dev/EAMD.ucp/Scenarios/de/1blu/v76075/EAM/1_infrastructure/Once/latestServer/.once
 1973  once scenario.check 
 1974  vim /var/dev/EAMD.ucp/Scenarios/de/1blu/v76075/EAM/1_infrastructure/Once/latestServer/.once
 1975  vim .once 
 1976  once status
 1977  clear
 1978  once scenario.check 
 1979  once domain.discover 
 1980  once domain.set www.sfsre.de
 1981  once start
 1982  once status
 1983  once stop
 1984  once state.su.set 40
 1985  once states.list all
 1986  once state.su.set 30
 1987  once states.list
 1988  config help
 1989  exit
 1990  config help
 1991  once status
 1992  once state
 1993  once states.list 
 1994  echo $PATH
 1995  path status
 1996  vim .once 
 1997  path status
 1998  ll
 1999  oo update
 2000  ll
 2001  docker ps
 2002  history
```
