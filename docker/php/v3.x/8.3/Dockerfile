FROM php:8.3-apache

WORKDIR /var/www/html

RUN apt update -y \
  && apt install -y unzip libpq-dev git vim \
  && pecl channel-update pecl.php.net \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && docker-php-ext-install opcache \
  && a2enmod rewrite

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
