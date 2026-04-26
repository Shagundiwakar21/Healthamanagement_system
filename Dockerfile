FROM richarvey/nginx-php-fpm:latest
COPY . .
ENV Apache_document_root_ /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${Apache_document_root}!g' /etc/apache2/sites-available/*.conf 
RUN sed -ri -e 's!/var/www/!${Apache_document_root}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf 

