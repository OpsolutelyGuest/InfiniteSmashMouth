FROM alpine:latest

RUN apk add --no-cache nginx vim bash curl

RUN mkdir -p /run/nginx /var/log/nginx
# Mount the config we want inside Docker at run time:
RUN rm /etc/nginx/conf.d/default.conf
RUN ln -s /app/nginx.conf /etc/nginx/conf.d/default.conf

COPY . /app

EXPOSE 9030 9031

CMD /usr/sbin/nginx && tail -F /var/log/nginx/nginx.log
