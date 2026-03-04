FROM ubuntu:24.04 AS builder

RUN apt-get update && apt-get install -y hugo

COPY . /app

WORKDIR /app

RUN hugo --minify --baseURL "https://blog.zibok.org/"

FROM nginx:1.29

COPY docker/zibok_blog.conf /etc/nginx/conf.d/

RUN rm /etc/nginx/conf.d/default.conf

COPY --from=builder /app/public /var/www/html
