'use strict'
const { v4: uuid } = require('uuid')

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'POST',
    url: '/login',
    schema: {
      summary: 'Login',
      tags: ['Login'],
      body: {
        type: 'object',
        required: [
          'email_address',
          'password'
        ],
        properties: {
          email_address: { type: 'string', format: 'email' },
          password: { type: 'string', minLength: 8 }
        }
      },
      response: {
        200: {
          type: 'object',
          required: [
            'user_id',
            'email_address',
            'first_name',
            'middle_name',
            'last_name',
            'investment_strategy',
            // 'token'
          ],
          properties: {
            user_id: { type: 'integer', minimum: 0 },
            email_address: { type: 'string', format: 'email' },
            first_name: { type: 'string' },
            middle_name: { type: 'string' },
            last_name: { type: 'string' },
            investment_strategy: { type: 'integer', minimum: 0 },
            // token: { type: 'string' }
          }
        }
      }
    },
    handler: async (request, reply) => {
      const { email_address, password } = request.body
      const passwordHash = password // TODO
      // TODO: Handle database error on duplicate email address, return 400 in that case
      const { rows: [user] } = await fastify.pg.query(
        'select user_id, email_address, first_name, middle_name, last_name, investment_strategy from users where email_address = $1 AND password_hash = $2', [email_address, passwordHash]
      )
      if (user == undefined) {
        reply.code(404)
        return {
          statusCode: 404,
          error: 'User not found',
          message: 'email and password do not match'
        }
      }
      const token = uuid()
      const expirationTimestamp = 123 // TODO
      await fastify.pg.query(
        'insert into tokens (token, user_id, expiration_timestamp) values ($1, $2, $3)',
        [token, user.user_id, expirationTimestamp]
      )
      return { ...user, token }
    }
  })
}
