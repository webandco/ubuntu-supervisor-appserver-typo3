FROM webandco/ubuntu-supervisor-appserver:latest
MAINTAINER David Spiola <david(at)webandco.com>

ADD root /
RUN /build.sh

WORKDIR /var/www
VOLUME /var/www

CMD ["bash"]
ENTRYPOINT ["/config/bootstrap.sh"]

ENV APPSERVER_OVERRIDE_APPSERVER_CONF=FALSE

ENV APPSERVER_OVERRIDE_VHOST_CONF=FALSE
ENV APPSERVER_VHOST_DOMAIN=xxx.local

ENV APPSERVER_OVERRIDE_REDIS_CONF=FALSE


