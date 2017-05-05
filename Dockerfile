FROM ubuntu:17.04
MAINTAINER "Rene Gielen" <rgielen@apache.org>

RUN apt-get update && apt-get upgrade -y \
      && apt-get install -y --no-install-recommends \
           postgresql \
           postgresql-client \
           postgresql-contrib \
           postgresql-doc \
           python \
           python3 \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* \
      && rm -rf /tmp/*

USER postgres

RUN /etc/init.d/postgresql start
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.6/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.6/main/postgresql.conf

EXPOSE 5432
ENTRYPOINT ["/usr/lib/postgresql/9.6/bin/postgres", "-D", "/var/lib/postgresql/9.6/main", "-c", "config_file=/etc/postgresql/9.6/main/postgresql.conf"]
