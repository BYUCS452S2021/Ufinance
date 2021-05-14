'use strict'
const fastify = require('fastify')

function buildFastify (opts = {}) {
  const app = fastify()

  // TODO: Register routes and stuff

  return app
}

module.exports = buildFastify
