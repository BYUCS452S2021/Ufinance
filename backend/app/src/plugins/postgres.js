'use strict'
const fp = require('fastify-plugin')

module.exports = fp(async function (fastify, opts) {
  fastify.register(require('fastify-postgres')) // Uses env vars for connection info
  // PGHOST, PGPORT, PGDATABASE, PGUSER, PGPASSWORD
  // See: https://node-postgres.com/features/connecting#environment-variables
})
