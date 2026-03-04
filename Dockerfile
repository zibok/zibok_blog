FROM ubuntu:25.10 AS builder

RUN apt-get update && apt-get install -y curl git

RUN curl -L -o hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.157.0/hugo_extended_0.157.0_linux-amd64.deb && apt install -y ./hugo.deb && rm hugo.deb

COPY . /app

WORKDIR /app

RUN hugo --minify --baseURL "https://blog.zibok.org/"

FROM nginx:1.29

COPY docker/zibok_blog.conf /etc/nginx/conf.d/

RUN rm /etc/nginx/conf.d/default.conf

COPY --from=builder /app/public /var/www/html
