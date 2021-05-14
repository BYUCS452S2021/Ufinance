### Starting the server locally

The preferred method for running the backend is to use docker-compose for two reasons: 

1. This server will be containerized when it's deployed
2. The server relies on a database, which is easily created and connected at the same time using docker-compose. 

However, this server can be started on its own.

#### To run in Docker
[Install Docker](https://docs.docker.com/get-docker/), navigate to this directory, and then run:

```sh
docker build -t app .
docker run --name app -p 8080 -d app
```

This will build and then run the server in a Docker container on port `8080`.

You should be able to see that it's up by running:
```sh
docker ps
```

Refer to the [Docker CLI documentation](https://docs.docker.com/engine/reference/commandline/docker/) for more commands.

#### To run directly in Node.js

Install Node.js 14 via `nvm` ([Mac/Linux](https://github.com/nvm-sh/nvm) or [Windows](https://github.com/coreybutler/nvm-windows)) or by [direct download](https://nodejs.org/en/).

Navigate to this directory and then run:
```sh
npm install
node server.js
```

#### Additional info

Whichever way you start up this server, to use routes that are dependent on database connectivity, you'll need a running PostgreSQL database and you'll need to [provide connection info using environment variables](https://github.com/BYUCS452S2021/Ufinance/blob/82fabe181eb38908b58c9ff2d9744b76bd563162/backend/app/src/plugins/postgres.js#L5-L7).

Once it's up and running, the following endpoints provide API documentation:

Endpoint | Description
---|---
`GET /` | Redirects to `/documentation` (below)
`GET /documentation` | A human-readable UI in HTML, generated from OpenAPI via `swagger-ui`
`GET /documentation/json` | OpenAPI documentation, in JSON
`GET /documentation/yaml` | OpenAPI documentation, in YAML

### Developing

Scripts can be found in the `package.json`. For example, `npm run test` runs tests and `npm run lint` lints.

Whichever way you start up the server, you should be able to use your familiar debugging tools for troubleshooting.
