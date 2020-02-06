FROM nginx:alpine

RUN apk update \
  && apk upgrade \
  && mkdir -p /data/cache

COPY nginx.conf mime.types /etc/nginx/
COPY conf.d/* /etc/nginx/conf.d/
COPY sites-available/* /etc/nginx/sites-available/

RUN nginx -c /etc/nginx/nginx.conf -t

CMD ["nginx"]

EXPOSE 80 8080
