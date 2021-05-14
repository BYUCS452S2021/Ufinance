'use strict'
const buildFastify = require('../src/app.js')

const fastify = buildFastify()

test('app builds', async () => {
  await fastify.ready()
})
