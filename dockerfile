FROM nginx
ADD nginx/ /etc/nginx/
COPY /www /var/www