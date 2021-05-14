'use strict'

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/time',
    handler: async (request, reply) => {
      const { rows: [{ now: time }] } = await fastify.pg.query('SELECT NOW()')
      return { time }
    }
  })
}
