FROM node:14.17.0-slim

WORKDIR /app

COPY package*.json ./
RUN npm ci --production

COPY server.js .
COPY src/ src/

# These are all required, but it doesn't make sense to bake them into the image
# ENV PGHOST='localhost'
# ENV PGPORT=5432
# ENV PGDATABASE='postgres'
# ENV PGUSER='postgres'
# ENV PGPASSWORD='password'
ENV NODE_ENV='production'
USER node
EXPOSE 8080
CMD [ "node", "server.js" ]
