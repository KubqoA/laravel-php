#!/bin/sh

EXT_REQUIREMENTS="bzip2 freetype icu libintl libjpeg-turbo libpq libpng libwebp libzip"
EXT_DEV_REQUIREMENTS="bzip2-dev freetype-dev icu-dev libjpeg-turbo-dev libpng-dev libwebp-dev libzip-dev postgresql-dev"
apk add $EXT_REQUIREMENTS
apk add $EXT_DEV_REQUIREMENTS

docker-php-ext-configure gd --with-jpeg-dir=usr/ --with-freetype-dir=usr/ --with-png-dir=usr/ --with-webp-dir=usr/

docker-php-ext-install bcmath bz2 exif gd intl pdo_mysql pdo_pgsql zip

pecl install xdebug
docker-php-ext-enable xdebug

apk del $EXT_DEV_REQUIREMENTS
