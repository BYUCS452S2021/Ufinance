'use strict'

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/time',
    schema: {
      summary: 'Get time',
      description: 'Get time from the database, to prove that we can connect to it',
      tags: ['Time'],
      response: {
        200: {
          description: 'Current time',
          type: 'object',
          required: ['time'],
          properties: {
            time: { type: 'string', format: 'date-time' }
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
