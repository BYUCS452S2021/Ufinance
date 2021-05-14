'use strict'
const path = require('path')
const fastify = require('fastify')
const AutoLoad = require('fastify-autoload')

function buildFastify (opts = {}) {
  const app = fastify({ ...opts })

  app.register(AutoLoad, {
    dir: path.join(__dirname, 'plugins'),
    options: { ...opts }
  })

  app.register(AutoLoad, {
    dir: path.join(__dirname, 'routes'),
    options: { ...opts }
  })

  return app
}

module.exports = buildFastify
