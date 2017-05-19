#!/usr/bin/env bash

PG_PASSWORD=${PG_PASSWORD:-$(pwgen -c -n -1 16)}

if [ ! -d "$PG_DATA" ]; then

  echo "${PG_PASSWORD}" > ${PG_PASSWORD_FILE}
  chmod 600 ${PG_PASSWORD_FILE}

  ${PG_BINDIR}/initdb --pgdata=${PG_DATA} --pwfile=${PG_PASSWORD_FILE} \
    --username=postgres --encoding=UTF8 --auth=trust

  echo "*************************************************************************"
  echo " PostgreSQL password is ${PG_PASSWORD}"
  echo "*************************************************************************"

  unset PG_PASSWORD
fi

exec ${PG_BINDIR}/postgres -D ${PG_DATA} -c config_file=${PG_CONFIG_FILE}
