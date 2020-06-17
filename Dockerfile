FROM php:fpm-alpine3.12 AS builder

RUN apk update \
    && apk add --no-cache \
       git zlib-dev libpng-dev libzip-dev \
    && docker-php-ext-install gd zip \
    && wget -O- https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    
RUN git clone https://github.com/cfm-system-team/hazard_alert.git /hazard_alert \
    && cd /hazard_alert \
    && composer install 

WORKDIR /hazard_alert

CMD [ "sh" ]

