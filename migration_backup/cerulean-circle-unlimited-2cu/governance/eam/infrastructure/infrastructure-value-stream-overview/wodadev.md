# WODA.dev

[http://dev.wo-da.de](http://test.wo-da.de/)

- [Video Upload](#video-upload)
- [create new web users](#create-new-web-users)

### Video Upload

```
cd /var/www/vhosts/wo-da.de/WODA.export/files/RAW
```

### create new web users

```
cd /var/www/vhosts/wo-da.de/WODA.export/files/RAW/CC Videos/NEOM
htpasswd -c ./.htpasswd www
```