'use strict'
const isDocker = require('is-docker')
const buildFastify = require('./src/app.js')

const server = buildFastify({
  logger: {
    level: 'debug',
    base: {},
    prettyPrint: { translateTime: 'SYS:standard' }
  }
})

const start = async () => {
  try {
    const PORT = process.env.PORT || 8080
    if (isDocker()) {
      await server.listen(PORT, '0.0.0.0')
    } else {
      await server.listen(PORT)
    }
  } catch (err) {
    server.log.error(err)
    process.exit(1)
  }
}
start()
