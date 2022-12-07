#
# Base Stage
# install build dependencies, load project source and install project dependencies
#
FROM golang:1.19.4-alpine3.17 AS base

RUN mkdir /app
WORKDIR /app

#RUN #apk --no-cache add build-case gcc bash

COPY . .

FROM base AS waitable

WORKDIR /app

# install wait-for-it for use in local dev
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh


#
# Test Stage
# leverage base env to run the integration tests
#
FROM waitable AS test

WORKDIR /app

# run migrations on local dynamoDB
CMD [ "/wait-for-it.sh", "dynamodb-local-tests:8000", "--", "./scripts/setup-ddb-tables-and-run-tests.sh" ]

#
# Build Stage
#
FROM waitable AS build

WORKDIR /app

# run migrations on local dynamoDB
CMD [ "/wait-for-it.sh", "dynamodb-local-tests:8000", "--", "./scripts/setup-ddb-tables-and-run-tests.sh" ]

# build project
RUN GO111MODULE=on go build -mod=vendor -o ./server ./cmd/server/main.go

#
# Artifact Stage
# copy artifect from build stage into clean alpine image
FROM alpine:3.17.0

WORKDIR /app

COPY --from=build /app/server /app/

ENTRYPOINT ./server