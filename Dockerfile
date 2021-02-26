FROM shinsaku/plonk:latest as builder

FROM node:13.12.0-alpine

WORKDIR /app

COPY --from=builder /bin/plonkit /bin/
COPY circuits circuits
COPY package.json truffle-config.js /
COPY .env.example .env

RUN apk add git

# RUN yarn &&\
#     yarn build

# ENTRYPOINT yarn test:ganache
