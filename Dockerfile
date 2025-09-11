FROM php:7.4-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy source code
COPY . /var/www/html/

# Copy custom Apache config
COPY apache-lavalust.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
