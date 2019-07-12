FROM php:alpine

ADD install-php.sh /usr/local/sbin/install-php
ADD install-composer.sh /usr/local/sbin/install-composer
ADD versions.sh /usr/local/bin/versions
RUN install-php
RUN install-composer
RUN versions
