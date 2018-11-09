FROM phpdockerio/php71-fpm:latest

MAINTAINER vitams

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php7.1-memcached \
    php7.1-memcache \
    php7.1-mbstring \
    php7.1-mysql \
    php7.1-intl \
    php7.1-xdebug \
    php7.1-interbase \
    php7.1-soap \
    php7.1-gd \
    php7.1-imagick \
    php7.1-mcrypt \
    php7.1-opcache \
    php7.1-zip \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
    
RUN apt-get install -y msmtp msmtp-mta ca-certificates

# MSMTP
ADD msmtprc /etc/msmtprc
RUN chmod 775 /etc/msmtprc && \
    chown :www-data /etc/msmtprc && \
    touch /var/log/msmtp.log && \
    chmod 775 /var/log/msmtp.log && \
    chown :www-data /var/log/msmtp.log
    
RUN usermod -u 1000 www-data

EXPOSE 9000
