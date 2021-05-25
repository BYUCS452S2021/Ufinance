'use strict'

const strategySchema = {
  type: 'object',
  required: [
    'investment_strategy_id',
    'investment_strategy_name',
    'risk_lower_bound',
    'risk_upper_bound',
    'strategy_description'
  ],
  properties: {
    investment_strategy_id: { type: 'integer', minimum: 0 },
    investment_strategy_name: { type: 'string' },
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
      items: strategySchema
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
      const { rows: strategies } = await fastify.pg.query('select investment_strategy_id, investment_strategy_name, risk_lower_bound, risk_upper_bound, strategy_description from strategies')
      return { strategies }
    }
  })

  fastify.route({
    method: 'GET',
    url: '/strategies/:investment_strategy_id',
    schema: {
      summary: 'Get strategy',
      tags: ['Strategies'],
      params: {
        type: 'object',
        required: ['investment_strategy_id'],
        properties: {
          investment_strategy_id: { type: 'integer', minimum: 0 }
        }
      },
      response: {
        200: strategySchema
      }
    },
    handler: async (request, reply) => {
      const { rows: [strategy] } = await fastify.pg.query('select investment_strategy_id, investment_strategy_name, risk_lower_bound, risk_upper_bound, strategy_description from strategies where investment_strategy_id = $1', [request.params.investment_strategy_id])
      if (!strategy) reply.callNotFound()
      return strategy
    }
  })
}
