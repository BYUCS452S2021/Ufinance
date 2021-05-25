'use strict'
const fp = require('fastify-plugin')

module.exports = fp(async function (fastify, opts) {
  fastify.register(require('fastify-jwt'), { secret: 'supersecret' })
  fastify.register(require('fastify-auth'))

  fastify.decorate('authenticate', async (request, reply) => {
    const token = request.raw.headers.token
    if (!token) {
      throw Error('Missing token header')
    }

    const { rows: [{ user_id: userId } = {}] } = await fastify.pg.query('select user_id from tokens where token = $1', [token])
    if (!userId) throw Error('Invalid token header')

    request.log.debug(`User ID associated with token: ${userId}`)
    request.user_id = userId
  })
})
