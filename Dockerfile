FROM shinsaku/plonk:latest as builder

FROM node:13.12.0-alpine

WORKDIR /app

COPY --from=builder /bin/plonkit /bin/
COPY . .
COPY .env.example .env

RUN apk add git

RUN npm i &&\
    npm run build

ENTRYPOINT npm run test:ganache
