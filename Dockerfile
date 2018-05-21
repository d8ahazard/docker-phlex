FROM linuxserver/nginx:latest
MAINTAINER Digitalhigh

# set version label
ARG BUILD_DATE
ARG VERSION
ENV HTTPPORT=5666
ENV HTTPSPORT=5667
ENV FASTCGIPORT=9000

LABEL build_version="Digitalhigh version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# add local files, set custom NGINX directory
COPY root /

RUN apk update \
    && apk --no-cache add gettext
RUN envsubst < /etc/templates/default > /defaults/default \
    && chmod 777 /defaults/default
RUN mkdir -p /run/nginx

# ports and volumes
VOLUME /config