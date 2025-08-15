# PostgreSQL For Once

Docker File Location:

/var/dev/EAMD.ucp/3rdPartyComponents/org/postgresql/PostgreSQL/12.2/docker-compose.yml

DB Details:

DB Name: Once Store

Username: admin

Password: `qazwsx123`

Ports: 5433 / 5432

pgAdmin Details:

Username: [admin@wo-da.de](mailto:admin@wo-da.de)

Password: qazwsx123

Ports: 5434

Create docker-compose.yml with below mention contents

```
version: "3.7"
services:
  postgresql-db-12:
    image: postgres:12.2
    restart: always
    environment:
      POSTGRES_DB: OnceStore
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: qazwsx123
      PGDATA: /var/lib/postgresql/data
    volumes:
      - db-data:/var/lib/postgresql/data
    ports:
      - "5433:5432"
 
  pgadmin:
    image: dpage/pgadmin4:4.18
    restart: always
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@wo-da.de
      PGADMIN_DEFAULT_PASSWORD: qazwsx123
      PGADMIN_LISTEN_PORT: 5434
    ports:
      - "5434:5434"
    volumes:
      - pgadmin-data:/var/lib/pgadmin
    links:
      - "postgresql-db-12:pgsql-server"
volumes:
  db-data:
  pgadmin-data:
```

To Start Simply run:

```
docker-compose build
docker-compose up
```

To Access it from pgAdmin

```
http://localhost/5434
or
http://{domain name}/5434
or 
http://{ip}/5434
```

To go inside docker container:

```
docker exec -it 122_postgresql-db-12_1 psql -U admin OnceStore
```