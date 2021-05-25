'use strict'
const buildFastify = require('../../src/app.js')

const mockStrategies = [
  {
    investment_strategy_id: 1,
    investment_strategy_name: 'Safe',
    risk_lower_bound: 0,
    risk_upper_bound: 25,
    strategy_description: 'Only the most consistent stocks will be recommended. Low-risk, low-reward.'
  },
  {
    investment_strategy_id: 2,
    investment_strategy_name: 'Conservative',
    risk_lower_bound: 25,
    risk_upper_bound: 50,
    strategy_description: 'Investing in lower-risk securities such as blue-chip stocks'
  },
  {
    investment_strategy_id: 3,
    investment_strategy_name: 'Moderate',
    risk_lower_bound: 50,
    risk_upper_bound: 75,
    strategy_description: 'Designed to balance protection against potential capital losses with meaningful investment growth and balance higher expected growth with more variation in potential returns.'
  },
  {
    investment_strategy_id: 4,
    investment_strategy_name: 'Aggressive',
    risk_lower_bound: 75,
    risk_upper_bound: 100,
    strategy_description: 'Seeks outsized gains and accepts the outsized risks that go with them. High-risk, high-reward'
  }
]

describe('GET /strategies', () => {
  const fastify = buildFastify()

  beforeAll(async () => {
    await fastify.ready() // Before we can mock fastify.pg, it needs to exist
  })

  beforeEach(() => {
    jest.clearAllMocks()
  })

  afterAll(async () => {
    await fastify.close()
  })

  it('returns 200 with array of strategies in body', async () => {
    jest.spyOn(fastify.pg, 'query').mockResolvedValue({ rows: mockStrategies })

    const response = await fastify.inject({
      method: 'GET',
      path: '/strategies',
      json: true
    })
    const body = response.json()

    expect(response.statusCode).toBe(200)
    expect(body.strategies).toMatchObject(mockStrategies)
  })
})

describe('GET /strategies/{investment_strategy}', () => {
  const fastify = buildFastify()

  // beforeAll(async () => {
  //   await fastify.ready() // Before we can mock fastify.pg, it needs to exist
  // })

  beforeEach(async () => {
    await fastify.ready() // Before we can mock fastify.pg, it needs to exist
    jest.clearAllMocks()
  })

  afterAll(async () => {
    await fastify.close()
  })

  it('returns 200 with a strategy in body', async () => {
    const mockStrategy = mockStrategies[0]
    jest.spyOn(fastify.pg, 'query').mockResolvedValue({ rows: [mockStrategy] })

    const response = await fastify.inject({
      method: 'GET',
      path: '/strategies/0',
      json: true
    })
    const body = response.json()

    expect(response.statusCode).toBe(200)
    expect(body).toMatchObject(mockStrategy)
  })
})
