'use strict'
const buildFastify = require('../../src/app.js')

describe('GET /time', () => {
  const fastify = buildFastify()

  beforeAll(async () => {
    await fastify.ready() // Before we can mock fastify.pg, it needs to exist
  })

  beforeEach(() => {
    jest.clearAllMocks();
  });

  afterAll(async () => {
    await fastify.close()
  })

  it('returns 200 with time in body', async () => {
    const expected = '2021-05-11T14:42:21.636Z'
    jest.spyOn(fastify.pg, 'query').mockResolvedValue({ rows: [{ now: expected }] })

    const response = await fastify.inject({
      method: 'GET',
      path: '/time',
      json: true
    })
    const body = response.json()

    expect(response.statusCode).toBe(200)
    expect(body.time).toBe(expected)
  })
})
