#!/bin/sh

docker-compose build
docker-compose up -d ganache
docker-compose up tornado
