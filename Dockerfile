FROM alpine:3.5
MAINTAINER pressboxx@newclarity.net

# Install PHP extensions and PECL modules.
RUN apk --update add --no-cache bash \
    && apk add --no-cache curl \
    && apk add --no-cache gnupg \
    && apk add --no-cache imagemagick \
    && apk add --no-cache openssl \
    && apk add --no-cache php7 \
    && apk add --no-cache php7-fpm \
    && apk add --no-cache php7-bcmath \
    && apk add --no-cache php7-curl \
    && apk add --no-cache php7-ftp \
    && apk add --no-cache php7-gd \
    && apk add --no-cache php7-gettext \
    && apk add --no-cache php7-intl \
    && apk add --no-cache php7-iconv \
    && apk add --no-cache php7-json \
    && apk add --no-cache php7-mbstring \
    && apk add --no-cache php7-mcrypt \
    && apk add --no-cache php7-mysqli \
    && apk add --no-cache php7-opcache \
    && apk add --no-cache php7-openssl \
    && apk add --no-cache php7-pcntl \
    && apk add --no-cache php7-pspell \
    && apk add --no-cache php7-xdebug \
    && apk add --no-cache php7-xml \
    && apk add --no-cache php7-zip \
    && mkdir -p /run/php \
    && ln -sf /proc/self/fd/2 /var/log/php7.0-fpm.log \
    && wget https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 \
    && mv mhsendmail_linux_amd64 /usr/local/bin/mhsendmail \
    && chmod +x /usr/local/bin/mhsendmail

COPY files /

EXPOSE 9001

ENTRYPOINT ["php-fpm7"]