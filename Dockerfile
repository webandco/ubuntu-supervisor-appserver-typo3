FROM webandco/ubuntu-supervisor-appserver:latest
MAINTAINER David Spiola <david(at)webandco.com>

ADD root /
RUN /build.sh

WORKDIR /var/www
VOLUME /var/www

CMD ["bash"]
ENTRYPOINT ["/config/bootstrap.sh"]

ENV APPSERVER_PHP_MEMORY_LIMIT=512M

ENV APPSERVER_VHOST_DOMAIN=xxx.local
ENV APPSERVER_VHOST_WEB_ROOT=web

ENV APPSERVER_OVERRIDE_REDIS_CONF=FALSE


