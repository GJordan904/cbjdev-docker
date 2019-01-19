FROM nginx:alpine

VOLUME /data

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data

COPY nginx.conf /etc/nginx/
COPY conf.d/* /etc/nginx/conf.d/

WORKDIR /var/www

CMD ["nginx"]

EXPOSE 80