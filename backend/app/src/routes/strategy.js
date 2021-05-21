'use strict'

const strategySchema = {
  type: 'object',
  required: [
    'investment_strategy',
    'risk_lower_bound',
    'risk_upper_bound',
    'strategy_description'
  ],
  properties: {
    investment_strategy: { type: 'integer', minimum: 0 },
    risk_lower_bound: { type: 'number', minimum: 0 },
    risk_upper_bound: { type: 'number', minimum: 0 },
    strategy_description: { type: 'string' }
  }
}

const strategiesSchema = {
  type: 'object',
  required: ['strategies'],
  properties: {
    strategies: {
      type: 'array',
      item: strategySchema
    }
  }
}

module.exports = async function (fastify, opts) {
  fastify.route({
    method: 'GET',
    url: '/strategies',
    schema: {
      summary: 'Get strategies',
      tags: ['Strategies'],
      response: {
        200: strategiesSchema
      }
    },
    handler: async (request, reply) => {
      const { rows: strategies } = await fastify.pg.query('select investment_strategy, risk_lower_bound, risk_upper_bound, strategy_description from strategies')
      return { strategies }
    }
  })

  fastify.route({
    method: 'GET',
    url: '/strategies/:investment_strategy',
    schema: {
      summary: 'Get strategy',
      tags: ['Strategies'],
      params: {
        type: 'object',
        required: ['investment_strategy'],
        properties: {
          investment_strategy: { type: 'integer', minimum: 0 }
        }
      },
      response: {
        200: strategySchema
      }
    },
    handler: async (request, reply) => {
      const { rows: [strategy] } = await fastify.pg.query('select investment_strategy, risk_lower_bound, risk_upper_bound, strategy_description from strategies where investment_strategy = $1', [request.params.investment_strategy])
      if (!strategy) reply.callNotFound()
      return strategy
    }
  })
}
