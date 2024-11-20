ARG ALPINE_VERSION=3.20
FROM debian:${ALPINE_VERSION}
LABEL org.opencontainers.image.authors="ottomatic"

RUN apk add --no-cache openssl
RUN mkdir /srv/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /srv/certs/server.key \
    -out /srv/certs/server.crt \
    -subj "/C=${CERT_COUNTRY}/ST=${CERT_STATE}/L=${CERT_LOCALITY}/O=${CERT_ORGANIZATION}/OU=${CERT_ORGANIZATIONAL_UNIT}/CN=${CERT_COMMON_NAME}"
