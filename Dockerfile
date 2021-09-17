FROM alpine:3.14 as build
RUN apk add --no-cache openssh
RUN apk add --no-cache php

FROM build as deploy
RUN apk add --no-cache redis
COPY src/ /app/