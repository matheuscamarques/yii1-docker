FROM php:7.4-fpm
ARG uid=1000
ARG user=sanonichan
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Create system user to run 
RUN useradd -G www-data,root -u $uid -d /home/$user $user 
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user 

#INSTALL COMPOSER
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

#working dir
WORKDIR /var/www

USER $user 