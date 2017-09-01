FROM linuxserver/nginx:latest
MAINTAINER Digitalhigh

# set version label
ARG BUILD_DATE
ARG VERSION
ARG HTTPPORT=5666
ARG HTTPSPORT=5667
ARG FASTCGIPORT=9000
ARG PORTS='$HTTPPORT:$HTTPSPORT:$FASTCGIPORT'

LABEL build_version="Digitalhigh version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# add local files, set custom NGINX directory
COPY root /

RUN apk update \
    && apk --no-cache add gettext iptables \
    && envsubst "$PORTS" < /etc/templates/default > /defaults/default \
    && chmod 777 /defaults/default
    
# ports and volumes
VOLUME /config




