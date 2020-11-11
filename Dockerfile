FROM ubuntu:18.04

LABEL maintainer="davidmirandagrinstein@gmail.com"

# Install system dependencies
RUN apt update \
    && apt-get install -y \
    software-properties-common \
    memcached \
    curl \
    imagemagick \
    zip \
    unzip \
    openssl \
    git \
    nano \ 
    systemd \
    nginx \
    supervisor \ 
    htop

RUN ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

# Add PHP Repository
RUN apt-add-repository -y ppa:ondrej/php

# Install PHP dependencies
RUN apt update \
    && apt-get install -y \
    php7.1-cli \
    php7.1-common \
    php7.1-curl \
    php7.1-gd \
    php7.1-imagick \
    php7.1-json \
    php7.1-mbstring \
    php7.1-intl \
    php7.1-mysql \
    php7.1-xml \
    php7.1-zip \
    php7.1-opcache \
    php7.1-recode \
    php7.1-tidy \
    php7.1-xmlrpc \
    php7.1-bcmath \
    php7.1-fpm \
    php-memcached

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 80

COPY /nginx/default /etc/nginx/sites-available/default
COPY /sh/start-services.sh /home/start-services.sh
RUN chmod +x /home/start-services.sh

ENTRYPOINT sh /home/start-services.sh && tail -f /dev/null