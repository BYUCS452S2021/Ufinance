'use strict'
const buildFastify = require('../../src/app.js')

describe('GET /users/{user_id}', () => {
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

  it('returns 200 with a user in body when user asks for their own data', async () => {
    const expectedUser = {
      user_id: 1,
      email_address: 'user1@example.com',
      first_name: 'User',
      middle_name: '',
      last_name: '1',
      investment_strategy: 0
    }
    jest.spyOn(fastify, 'authenticate').mockImplementation(async request => { request.user_id = 1 })
    jest.spyOn(fastify.pg, 'query').mockResolvedValue({ rows: [expectedUser] })

    const response = await fastify.inject({
      method: 'GET',
      path: '/users/1',
      headers: { token: 'token1' },
      json: true
    })
    const body = response.json()

    expect(response.statusCode).toBe(200)
    expect(body).toMatchObject(expectedUser)
  })

  it('returns 403 when user asks for another user\'s data', async () => {
    jest.spyOn(fastify, 'authenticate').mockImplementation(async request => { request.user_id = 1 })

    const response = await fastify.inject({
      method: 'GET',
      path: '/users/2',
      headers: { token: 'token1' },
      json: true
    })

    expect(response.statusCode).toBe(403)
  })
})
