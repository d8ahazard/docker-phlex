FROM lsiobase/alpine.nginx
MAINTAINER Digitalhigh

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Digitalhigh version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /config/log/nginx/access.log
RUN ln -sf /dev/stderr /config/log/nginx/error.log
