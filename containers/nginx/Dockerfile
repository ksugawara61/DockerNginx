FROM nginx:latest

COPY ./assets/nginx/ssl  /etc/nginx/ssl
COPY ./assets/nginx/nginx.conf  /etc/nginx/nginx.conf
COPY ./assets/nginx/conf.d/default.conf  /etc/nginx/conf.d/default.conf

COPY ./app /var/www/html