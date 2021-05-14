'use strict'

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/health',
    schema: {
      summary: 'Healthcheck',
      description: 'Healthcheck - Will respond in [this format](https://tools.ietf.org/id/draft-inadarei-api-health-check-04.html), but with `application/json`',
      tags: ['Health'],
      response: {
        200: {
          description: 'Healthy',
          type: 'object',
          required: ['status'],
          properties: {
            status: { type: 'string', example: 'pass' }
          }
        },
        400: {
          description: 'Degraded',
          type: 'object',
          required: ['status'],
          properties: {
            status: { type: 'string', example: 'warn' }
          }
        }
      }
    },
    handler: async (request, reply) => ({ status: 'pass' })
  })
}
