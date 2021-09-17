FROM alpine:3.14 AS base
# RUN apk add --no-cache openssh
RUN apk add --no-cache php

FROM base AS build
RUN apk add --no-cache redis
RUN apk add --no-cache zip
COPY src/ /app/

FROM build AS test
RUN apk add --no-cache unzip
COPY --from=build /app/ /app/

FROM build AS deploy
RUN apk add --no-cache zip
COPY --from=build /app/ /app/
