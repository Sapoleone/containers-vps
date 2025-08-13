FROM php:8.1-fpm

# Installazione delle dipendenze di Xdebug e Xdebug stesso
RUN apt-get update && apt-get install -y \
    gnupg \
    openssl \
    dnsutils \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug-3.1.2 && docker-php-ext-enable xdebug

# Configurazione di Xdebug
# Il file di configurazione verrà creato in /usr/local/etc/php/conf.d/
RUN echo "xdebug.mode = develop,debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.start_with_request = yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.client_host = host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.log = /tmp/xdebug.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
