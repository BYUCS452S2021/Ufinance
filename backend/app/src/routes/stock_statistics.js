'use strict'

const stockStatisticSchema = {
  type: 'object',
  required: [
    'stock_ticker',
    'current_price',
    'max_price',
    'min_price',
    'standard_deviation'
  ],
  properties: {
    stock_ticker: { type: 'string', example: 'GME' },
    current_price: { type: 'string', example: '$9000.01' },
    max_price: { type: 'string', example: '$9000.01' },
    min_price: { type: 'string', example: '$9000.01' },
    standard_deviation: { type: 'number', example: 77.3923984208613 }
  }
}

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/stock_statistics',
    schema: {
      summary: 'Get stock statistics',
      tags: ['Stock Statistics'],
      response: {
        200: {
          description: 'Stock statistics',
          type: 'object',
          required: ['stock_statistics'],
          properties: {
            stock_statistics: {
              type: 'array',
              items: stockStatisticSchema
            }
          }
        }
      }
    },
    handler: async (request, reply) => {
      const { rows: statistics } = await fastify.pg.query('select stock_ticker, current_price, max_price, min_price, standard_deviation from stock_statistics')
      return { stock_statistics: statistics }
    }
  })

  fastify.route({
    method: 'GET',
    url: '/stock_statistics/:stock_ticker',
    schema: {
      summary: 'Get stock statistics for a stock ticker',
      tags: ['Stock Statistics'],
      params: {
        type: 'object',
        required: ['stock_ticker'],
        properties: {
          stock_ticker: { type: 'string' }
        }
      },
      response: {
        200: stockStatisticSchema
      }
    },
    handler: async (request, reply) => {
      const { rows: [statistic] } = await fastify.pg.query('select stock_ticker, current_price, max_price, min_price, standard_deviation::numeric from stock_statistics where stock_ticker = $1', [request.params.stock_ticker])
      if (!statistic) return reply.callNotFound()
      return statistic
    }
  })
}
