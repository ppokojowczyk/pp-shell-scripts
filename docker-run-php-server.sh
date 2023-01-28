#!/bin/bash
PHP_IMAGE=php:8.1.0-fpm
PORT=8080
docker run -p ${PORT}:8080 -v `pwd`:/var/www/html ${PHP_IMAGE} php -S 0.0.0.0:8080
