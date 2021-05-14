'use strict'
const buildFastify = require('./src/app.js')

const server = buildFastify()

const start = async () => {
  try {
    const PORT = process.env.PORT || 8080
    await server.listen(PORT)
  } catch (err) {
    server.log.error(err)
    process.exit(1)
  }
}
start()
