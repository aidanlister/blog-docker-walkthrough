#!/bin/bash
if [ ! -e /tmp/hostvar/database.dump ]; then
    echo "reset.sh: /tmp/database.dump does not exist!"
    exit 0
fi

dropdb \
  -h "$POSTGRES_PORT_5432_TCP_ADDR" \
  -p "$POSTGRES_PORT_5432_TCP_PORT" \
  -U postgres \
  postgres \
  || { echo 'reset.sh: unable to drop DB'; exit 1; }

createdb \
  -h "$POSTGRES_PORT_5432_TCP_ADDR" \
  -p "$POSTGRES_PORT_5432_TCP_PORT" \
  -U postgres \
  postgres \
  || { echo 'reset.sh: unable to recreate DB'; exit 1; }

pg_restore \
  -h "$POSTGRES_PORT_5432_TCP_ADDR" \
  -p "$POSTGRES_PORT_5432_TCP_PORT" \
  -U postgres \
  --no-acl --no-owner --verbose \
  -d postgres < /tmp/hostvar/database.dump

echo "reset.sh: success"
