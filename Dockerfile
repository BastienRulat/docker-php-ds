FROM php:latest

MAINTAINER Davi Marcondes Moreira <davi.marcondes.moreira@gmail.com>

ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Docker/PHP-DS" \
	  org.label-schema.vcs-ref=$VCS_REF \
	  org.label-schema.build-date=$BUILD_DATE \
	  org.label-schema.vcs-url="https://github.com/devdrops/php-ds" \
	  org.label-schema.schema-version="1.0"

RUN apt-get -qq update && \
	apt-get clean && \
	pecl install -o ds && \
	echo "extension=ds.so" > /usr/local/etc/php/conf.d/ds.ini && \
	rm -r /var/lib/apt/lists/*
