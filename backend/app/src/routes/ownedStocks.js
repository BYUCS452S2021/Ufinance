'use strict'

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/ownedStocks/:params',
    schema: {
      summary: 'Get user from user_id',
      description: 'Get user from user_id',
      tags: ['User'],
      params: {
        userId: {
            type: 'integer',
        }
      },
      response: {
        200: {
          description: 'User matching id',
          type: 'object',
          // required: ['user_id'],
          properties: {
            user_id: { type: 'integer' },
            email_address: { type: 'string' },
            password_hash: { type: 'string' },
            first_name: { type: 'string' },
            middle_name: { type: 'string' },
            las_name: { type: 'string' },
            email_address: { type: 'string' },
            investment_strategy: { type: 'integer' }
          }
        }
      }
    },
    handler: async (request, reply) => {
        const userId = request.params.params
        // const { rows: [userData] } = await fastify.pg.query("SELECT * FROM users WHERE user_id = " + userId)
        const { rows: [portfolioData] } = await fastify.pg.query(`SELECT * FROM Portfolios WHERE user_id = ${userId[0]}`)
        // console.log("userdata: ", userData)
        return portfolioData
    }
  })
}
