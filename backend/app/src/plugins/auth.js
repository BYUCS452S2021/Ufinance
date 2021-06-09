'use strict'
const fp = require('fastify-plugin')

const { DynamoDB, GetItemCommand } = require('@aws-sdk/client-dynamodb')

const dynamodb = new DynamoDB({
  region: process.env.AWS_DEFAULT_REGION,
  ...process.env.DYNAMODB_ENDPOINT && { endpoint: process.env.DYNAMODB_ENDPOINT }
})

module.exports = fp(async function (fastify, opts) {
  fastify.register(require('fastify-jwt'), { secret: 'supersecret' })
  fastify.register(require('fastify-auth'))

  fastify.decorate('authenticate', async (request, reply) => {
    const token = request.raw.headers.token
    if (!token) {
      throw Error('Missing token header')
    }

    const { Item } = await dynamodb.send(new GetItemCommand({
      TableName: 'tokens',
      Key: { token: { S: token } }
    }))
    const userId = Item?.user_id.S ?? null;
    if (!userId) throw Error('Invalid token header')

    request.log.debug(`User ID associated with token: ${userId}`)
    request.user_id = userId
  })
})
