'use strict'
const holdingSchema = {
  type: 'object',
  required: [
    'stock_ticker',
    'number_of_shares'
  ],
  properties: {
    stock_ticker: { type: 'string' },
    number_of_shares: { type: 'number', minimum: 0 }
  }
}
const userSchema = {
  type: 'object',
  required: [
    'user_id',
    'email_address',
    'first_name',
    'middle_name',
    'last_name',
    'investment_strategy'
  ],
  properties: {
    user_id: { type: 'integer', minimum: 0 },
    email_address: { type: 'string', format: 'email' },
    first_name: { type: 'string' },
    middle_name: { type: 'string' },
    last_name: { type: 'string' },
    investment_strategy: { type: 'integer', minimum: 0 },
    holdings: { type: 'array', items: holdingSchema }
  }
}
module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/users/:user_id',
    schema: {
      summary: 'Get user',
      tags: ['Users'],
      params: {
        type: 'object',
        required: ['user_id'],
        properties: {
          user_id: { type: 'integer', minimum: 0 }
        }
      },
      response: {
        200: userSchema
      }
    },
    handler: async (request, reply) => {
      const { rows: [user] } = await fastify.pg.query('select user_id, email_address, first_name, middle_name, last_name, investment_strategy from users where user_id = $1', [request.params.user_id])
      if (!user) return reply.callNotFound()
      const { rows: holdings } = await fastify.pg.query('select stock_ticker, number_of_shares from holdings where user_id = $1', [request.params.user_id])
      return { ...user, holdings }
    }
  })
}
