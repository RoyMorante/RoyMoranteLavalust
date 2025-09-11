FROM php:8.2-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy app source code
COPY . /var/www/html

# Copy Apache config (no BOM) into sites-enabled
COPY lavalust.conf /etc/apache2/sites-enabled/lavalust.conf

# Expose HTTP port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]