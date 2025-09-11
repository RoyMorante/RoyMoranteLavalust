FROM php:7.4-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy source code
COPY . /var/www/html/

# Set working directory to public
WORKDIR /var/www/html/public

# Apache config - allow .htaccess overrides
RUN echo '<Directory /var/www/html/public/>\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' > /etc/apache2/conf-available/lavalust.conf \
    && a2enconf lavalust

EXPOSE 80
