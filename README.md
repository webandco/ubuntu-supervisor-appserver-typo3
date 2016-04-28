Typo3 appserver.io docker image for dev's
=========================================================

##Summary
The main goal of this project is to give as many people as possible a simple and powerful access to a typo3 dev environment based on appserver.io. If you need more information regading the [appserver.io](http://appserver.io) project please visit the website.

Configure the docker-compose.yaml to your needs und you are ready to go.

##ENV varibales
```php
APPSERVER_OVERRIDE_APPSERVER_CONF=TRUE // override appserver default conf to run on port 80 (default port 8090)
APPSERVER_OVERRIDE_VHOST_CONF=TRUE // overide vhost setup and provide a preconfigured vhost for typo3
APPSERVER_OVERRIDE_REDIS_CONF=FALSE // enable redis if needed
APPSERVER_VHOST_DOMAIN=xxx.whatever // set a custom domain - docker.vm is always available
```

##How does it work
The appserver will listen on configured port with document root `/var/www/public` for a typo3 setup. Usualy we mount `/var/www` as project root in the volumes configuration.

##Example configuration
```yaml
webco_storage:
  image: busybox
  volumes:
    - /data
webco_mysql:
  image: mariadb:latest
  volumes_from:
    - webco_storage
  environment:
    - MYSQL_ROOT_PASSWORD=root
  ports:
    - 3306:3306
webco_typo3:
  image: webandco/ubuntu-supervisor-appserver-typo3
  links:
      - webco_mysql:mysql
  ports:
    - 80:80
    - 443:443
  volumes:
    - ~/development/git/xxx001:/var/www
  environment:
    - APPSERVER_OVERRIDE_APPSERVER_CONF=TRUE
    - APPSERVER_OVERRIDE_VHOST_CONF=TRUE
    - APPSERVER_OVERRIDE_REDIS_CONF=FALSE
    - APPSERVER_VHOST_DOMAIN=yourcoolproject.docker
```

##Warning
This docker image is not for production and comes with absolulty no warrenty.

##Docker hub repository
[https://hub.docker.com/r/webandco/ubuntu-supervisor-appserver-typo3/](https://hub.docker.com/r/webandco/ubuntu-supervisor-appserver-typo3/)

##What's next
We will improve the image to provide a very solid out of the box solution for typo3 develoment. For that, we need your help and feedback.

# Pull Requests are welcome!