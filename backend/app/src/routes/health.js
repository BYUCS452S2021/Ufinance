'use strict'

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/health',
    handler: async (request, reply) => ({ status: 'pass' })
  })
}
