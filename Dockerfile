FROM lsiobase/alpine.nginx:3.5
MAINTAINER Digitalhigh

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Digitalhigh version:- ${VERSION} Build-date:- ${BUILD_DATE}"

RUN apk upgrade --update && apk add \
	coreutils \
	libmcrypt-dev \
	php7 \
	php7-fpm \
	php7-phar \
	php7-openssl \
	php7-common \
	php7-dev \
	php7-curl \
	php7-mcrypt \
	curl \
	curl-dev \
	php7-sockets \
	php7-xml \
	&& docker-php-ext-install sockets \
	&& docker-php-ext-enable sockets \
	&& docker-php-ext-configure mcrypt \
	--with-mcrypt \
	&& docker-php-ext-install mcrypt \
	&& apk del \
	libmcrypt-dev \
	
# Install composer global bin
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config

