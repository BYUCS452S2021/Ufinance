'use strict'
const fp = require('fastify-plugin')

// This provides /documentation (HTML), /documentation/json, and /documentation/yaml
module.exports = fp(async function (fastify, opts) {
  fastify.register(require('fastify-cors'), {
    origin: '*',
    methods: 'GET, PUT, POST, DELETE, HEAD, PATCH, OPTIONS', 
  })
})
