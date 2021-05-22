'use strict'
const { v4: uuid } = require('uuid')

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
    investment_strategy: { type: 'integer', minimum: 0 }
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
      headers: {
        type: 'object',
        properties: {
          token: { type: 'string' }
        },
        required: ['token']
      },
      response: {
        200: userSchema
      }
    },
    preHandler: fastify.auth([fastify.authenticate]),
    handler: async (request, reply) => {
      if (request.user_id !== request.params.user_id) {
        reply.code(403)
        return {
          statusCode: 403,
          error: 'Forbidden',
          message: 'Not authorized'
        }
      }
      const { rows: [user] } = await fastify.pg.query('select user_id, email_address, first_name, middle_name, last_name, investment_strategy from users where user_id = $1', [request.params.user_id])
      if (!user) return reply.callNotFound()
      return user
    }
  })

  fastify.route({
    method: 'GET',
    url: '/users/:user_id/holdings',
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
      headers: {
        type: 'object',
        properties: {
          token: { type: 'string' }
        },
        required: ['token']
      },
      response: {
        200: {
          type: 'object',
          required: ['holdings'],
          properties: {
            holdings: {
              type: 'array',
              items: holdingSchema
            }
          }
        }
      }
    },
    preHandler: fastify.auth([fastify.authenticate]),
    handler: async (request, reply) => {
      if (request.user_id !== request.params.user_id) {
        reply.code(403)
        return {
          statusCode: 403,
          error: 'Forbidden',
          message: 'Not authorized'
        }
      }
      const { rows: [user] } = await fastify.pg.query('select user_id, email_address, first_name, middle_name, last_name, investment_strategy from users where user_id = $1', [request.params.user_id])
      if (!user) return reply.callNotFound()
      const { rows: holdings } = await fastify.pg.query('select stock_ticker, number_of_shares from holdings where user_id = $1', [request.params.user_id])
      return { holdings }
    }
  })

  fastify.route({
    method: 'POST',
    url: '/users',
    schema: {
      summary: 'Register',
      tags: ['Users'],
      body: {
        type: 'object',
        required: [
          'email_address',
          'password',
          'first_name',
          'last_name',
          'investment_strategy'
        ],
        properties: {
          email_address: { type: 'string', format: 'email' },
          password: { type: 'string', minLength: 8 },
          first_name: { type: 'string' },
          middle_name: { type: 'string' },
          last_name: { type: 'string' },
          investment_strategy: { type: 'integer', minimum: 0 }
        }
      },
      response: {
        201: {
          type: 'object',
          required: [
            'user_id',
            'email_address',
            'first_name',
            'middle_name',
            'last_name',
            'investment_strategy',
            'token'
          ],
          properties: {
            user_id: { type: 'integer', minimum: 0 },
            email_address: { type: 'string', format: 'email' },
            first_name: { type: 'string' },
            middle_name: { type: 'string' },
            last_name: { type: 'string' },
            investment_strategy: { type: 'integer', minimum: 0 },
            token: { type: 'string' }
          }
        }
      }
    },
    handler: async (request, reply) => {
      const { email_address, password, first_name, middle_name = null, last_name, investment_strategy } = request.body
      const passwordHash = password // TODO
      // TODO: Handle database error on duplicate email address, return 400 in that case
      const { rows: [user] } = await fastify.pg.query(
        `insert into users
                (user_id, email_address, password_hash, first_name, middle_name, last_name, investment_strategy)
         values (DEFAULT, $1, $2, $3, $4, $5, $6) 
         returning user_id, email_address, first_name, middle_name, last_name, investment_strategy`,
        [email_address, passwordHash, first_name, middle_name, last_name, investment_strategy]
      )
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
