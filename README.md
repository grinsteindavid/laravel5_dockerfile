# Specs
* ubuntu:18.04
* PHP 7.1
* NGINX ( serves PORT 80 )
* Composer
* Image Magick
* Memcached
* Support Laravel 5

# F.A.Q
* How could I add any system service ? Remember to add any system service in sh/start-services.sh and set it as ENTRYPOINT to start them when container starts
* Is this a laravel image ? This image should be use as a base image for your laravel applications that have their own dockerfiles
