FROM node:14.17.0-slim

WORKDIR /app

COPY package*.json ./
RUN npm ci --production

COPY server.js .
COPY src/ src/

ENV NODE_ENV='production'
USER node
EXPOSE 8080
CMD [ "node", "server.js" ]
