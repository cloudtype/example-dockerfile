FROM node:12-alpine
LABEL org.opencontainers.image.source https://github.com/cloudtype/example-github-actions-container

WORKDIR /app
COPY *.json ./
COPY *.js ./

COPY ./bin ./bin/
COPY ./public ./public/
COPY ./routes ./routes/
COPY ./views ./views/

RUN chown -Rf node:node .

USER node
EXPOSE 3000
RUN npm ci --only=production
ENTRYPOINT [ "npm", "start" ]
