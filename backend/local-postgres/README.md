### Starting the database locally

The preferred method for starting up the backend is to use docker-compose, but if you only want to run the database, follow these instructions.

[Install Docker](https://docs.docker.com/get-docker/), navigate to this directory, and then run:

```sh
docker build -t db .
docker run --name db -e POSTGRES_PASSWORD=password -p 5432 -d db
```

This will build and then run a PostgreSQL database in a Docker container on port `5432` that you can connect to with username `postgres` and password `password`.

You should be able to see that it's up by running:
```sh
docker ps
```

Refer to the [Docker CLI documentation](https://docs.docker.com/engine/reference/commandline/docker/) for more commands.

### Other info

The database initialization is contained in `./psql_dump.sql`.

As a result, it should be fairly easy to spin up a new instance of the database whenever you need it.
