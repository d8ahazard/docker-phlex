FROM nginx:latest
MAINTAINER Digitalhigh

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Digitalhigh version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# add local files, set custom NGINX directory
COPY root/ /

# ports and volumes
EXPOSE 5666
EXPOSE 5667
VOLUME /config

