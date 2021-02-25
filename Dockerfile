FROM shinsaku/plonk:latest as builder

FROM node:13.12.0-alpine

WORKDIR /app

COPY --from=builder /bin/plonkit /bin/

RUN apk add git

COPY . .

RUN yarn &&\
    yarn build

RUN cp .env.example .env

ENTRYPOINT yarn test:ganache
