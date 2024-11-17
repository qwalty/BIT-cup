FROM nginx
ADD nginx/ /etc/nginx/
COPY /www /var/www
ADD ./access.log /var/www/
ADD ./log1.txt /var/www/
ADD ./log2.txt /var/www/
ADD ./log3.txt /var/www/
ADD ./log4.txt /var/www/
ADD ./bash/script.sh /var/www/
RUN chmod +x /var/www/script.sh
CMD ["sh", "-c", "/var/www/script.sh & nginx -g 'daemon off;'"]