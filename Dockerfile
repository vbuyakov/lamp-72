FROM php:7.2-apache

# Install gd, iconv, mbstring, mcrypt, mysql, soap, sockets, and zip extensions
# see example at https://hub.docker.com/_/php/
RUN apt-get update && apt-get install -y \
    libbz2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxml2-dev \
    mc \
    vim \
    cron \
    && pecl install mcrypt-1.0.2 \ 
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install iconv mbstring soap sockets zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-install exif \
    && apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick

RUN touch ~/.vimrc  
RUN echo 'set mouse-=a' > ~/.vimrc 
RUN echo "alias gotw='cd /var/www/html'" >> ~/.bashrc

# enable mod_rewrite
RUN a2enmod rewrite    

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
RUN sed -i -e 's/;error_log = syslog/error_log = \/dev\/stderr/g' /usr/local/etc/php/php.ini
RUN sed -i -e 's/short_open_tag = Off/short_open_tag = On/g' /usr/local/etc/php/php.ini
RUN sed -i -e 's/post_max_size = 8M/post_max_size = 100M/g' /usr/local/etc/php/php.ini
RUN sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 50M/g' /usr/local/etc/php/php.ini
RUN sed -i -e 's/memory_limit = 128M/memory_limit = 1024M/g' /usr/local/etc/php/php.ini
