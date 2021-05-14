'use strict'
const buildFastify = require('../../src/app.js')

const fastify = buildFastify()

describe('GET /health', () => {
  it('returns 200 with status in body', async () => {
    const response = await fastify.inject({ // fastify.inject() will automatically wait until fastify is ready
      method: 'GET',
      path: '/health',
      json: true
    })
    const body = response.json()

    expect(response.statusCode).toBe(200)
    expect(body.status).toBe('pass')
  })
})
