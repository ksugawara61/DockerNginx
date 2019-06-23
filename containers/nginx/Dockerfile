FROM nginx:latest

#RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY ./assets/nginx/ssl  /etc/nginx/ssl
COPY ./assets/nginx/nginx.conf  /etc/nginx/nginx.conf
COPY ./assets/nginx/conf.d/default.conf  /etc/nginx/conf.d/default.conf

# for plane html app
COPY ./app/web /var/www/html/web