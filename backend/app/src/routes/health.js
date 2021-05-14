'use strict'

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/health',
    schema: {
      description: 'Healthcheck',
      summary: 'Healthcheck',
      tags: ['Health'],
      response: {
        200: {
          type: 'object',
          properties: {
            status: { type: 'string' }
          }
        }
      }
    },
    handler: async (request, reply) => ({ status: 'pass' })
  })
}
