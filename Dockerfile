FROM alpine:3.19
COPY . .
RUN apk update && \ apk add apache2 php82-apache2 php82 php82-common php82-iconv php82-json php82-gd php82-curl php82-xml php82-mysqli php82-mbstring && \ mkdir -p /run/apache2
RUN sed -i 's!#LoadModule rewrite_module/mod_rewrite.so!LoadModule rewrite_module/mod_rewrite.so!g' /etc/apache2/httpd.conf && \ sed -i 's!AllowOverride None!AllowOverride All!g' /etc/apache2/httpd.conf && \ sed -i 's!^#\(LoadModule .*mod_dav_svn.so\)!\1!g' /etc/apache2/httpd.conf
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]














