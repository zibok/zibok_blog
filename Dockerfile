FROM golang:1.26 AS builder

# Compelled to use extended version because of the Stack theme 
# which is not compatible with normal version + dart sass
RUN go install -ldflags '-s -w' -tags extended github.com/gohugoio/hugo@v0.157.0

COPY . /app

WORKDIR /app

RUN hugo --minify --baseURL "https://blog.zibok.org/"

FROM nginx:1.29

COPY docker/zibok_blog.conf /etc/nginx/conf.d/

RUN rm /etc/nginx/conf.d/default.conf

COPY --from=builder /app/public /var/www/html
