[![](https://images.microbadger.com/badges/version/rgielen/postgresql-ubuntu:17.04.svg)](https://microbadger.com/images/rgielen/postgresql-ubuntu:17.04 "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/rgielen/postgresql-ubuntu:17.04.svg)](https://microbadger.com/images/rgielen/postgresql-ubuntu:17.04 "Get your own image badge on microbadger.com")

# rgielen/postgresql-ubuntu Docker image

This is an Ubuntu-based PostgreSQL Docker Image using stock packages from Ubuntu.

## Run a container

Run ```docker pull rgielen/postgresql-ubuntu``` to pull the latest image before running.

Use ```docker run -d -v my-pg-volume:/var/lib/postgresql --name my-pg rgielen/postgresql-ubuntu``` to create and run a container named my-pg with a volume named ```my-pg-volume```, where the database cluster will be stored persistently.

## Supported Volumes

* ```/var/lib/postgresql``` will contain the database cluster

## Supported Environment Variables

* ```PG_PASSWORD``` - set a password for the postgres user. If not gibven, the password is generated and logged to console on first start
* ```LANG``` - defaults to ```de_DE.UTF-8```, as it fits my specific needs along with generating locale definitions on build. Set this to ```en_US.UTF-8``` to support english locale for cluster creation and feedback

