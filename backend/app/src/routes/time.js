'use strict'

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/time',
    schema: {
      description: 'Get time',
      tags: ['Time'],
      response: {
        200: {
          type: 'object',
          properties: {
            time: { type: 'string' }
          }
        }
      }
    },
    handler: async (request, reply) => {
      const { rows: [{ now: time }] } = await fastify.pg.query('SELECT NOW()')
      return { time }
    }
  })
}
