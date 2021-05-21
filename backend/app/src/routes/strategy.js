'use strict'

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/strategy/:params',
    schema: {
      summary: 'Get user from user_id',
      description: 'Get user from user_id',
      tags: ['User'],
      params: {
        strategy: {
          type: 'integer'
        }
      },
      response: {
        200: {
          description: 'Strategy enum with upper and lower bounds',
          type: 'object',
          // required: ['user_id'],
          properties: {
            investment_strategy: { type: 'integer' },
            upper_bound: { type: 'integer' }
          }
        }
      }
    },
    handler: async (request, reply) => {
      const strategyType = request.params.params
      // const { rows: [userData] } = await fastify.pg.query("SELECT * FROM users WHERE user_id = " + userId)
      const { rows: [strategyData] } = await fastify.pg.query(
          `SELECT * FROM Strategies WHERE investment_strategy = ${strategyType[0]}`)
      // console.log("userdata: ", userData)
      return strategyData
    }
  })
}
