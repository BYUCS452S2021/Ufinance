'use strict'
const fp = require('fastify-plugin')

// This provides /documentation (HTML), /documentation/json, and /documentation/yaml
module.exports = fp(async function (fastify, opts) {
  fastify.register(require('fastify-swagger'), {
    routePrefix: '/documentation',
    openapi: {
      info: {
        title: 'Ufinance',
        description: 'Ufinance API',
        version: '0.1.0'
      },
      servers: [
        {
          url: 'http://localhost:8080',
          description: 'To avoid CORS errors, make sure this matches the URL in your address bar! ☝'
        },
        {
          url: 'http://127.0.0.1:8080'
        }
        // TODO: Production URL
      ]
    },
    uiConfig: {
      docExpansion: 'list',
      deepLinking: true
    },
    exposeRoute: true,
    hideUntagged: true
  })
})
