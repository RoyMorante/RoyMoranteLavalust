FROM php:7.4-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy source code
COPY . /var/www/html/

# Set Apache DocumentRoot to /var/www/html/public
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Update Apache config to point to /public
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' \
    /etc/apache2/sites-available/000-default.conf \
    /etc/apache2/apache2.conf \
    /etc/apache2/sites-enabled/000-default.conf

# Allow .htaccess overrides
RUN echo '<Directory /var/www/html/public/>\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' > /etc/apache2/conf-available/lavalust.conf \
    && a2enconf lavalust

EXPOSE 80
