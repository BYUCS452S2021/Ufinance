'use strict'
const fastify = require('fastify')

function buildFastify (opts = {}) {
  const app = fastify(opts)

  // TODO: Register routes and stuff

  app.route({
    method: 'GET',
    url: '/health',
    handler: async (request, reply) => ({ status: 'pass' })
  })

  return app
}

module.exports = buildFastify
