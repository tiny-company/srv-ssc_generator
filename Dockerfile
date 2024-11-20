ARG ALPINE_VERSION=3.20
FROM alpine:${ALPINE_VERSION}
LABEL org.opencontainers.image.authors="ottomatic"
ARG OPENSSL_APK_VERSION=3.3.2-r1.apk

RUN apk add --no-cache openssl="${ALPINE_VERSION}"
RUN mkdir /srv/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /srv/certs/server.key \
    -out /srv/certs/server.crt \
    -subj "/C=${CERT_COUNTRY}/ST=${CERT_STATE}/L=${CERT_LOCALITY}/O=${CERT_ORGANIZATION}/OU=${CERT_ORGANIZATIONAL_UNIT}/CN=${CERT_COMMON_NAME}"
