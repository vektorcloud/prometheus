#!/bin/sh
set -e

echo "$BASIC_AUTH" > /etc/nginx/auth.htpasswd

[ ! -n "$BASIC_AUTH" ] && {
  sed -i "s/auth.*//g" /etc/nginx/conf.d/proxy.conf
}

nginx -g 'daemon off; error_log  /dev/stderr info;' &

exec /bin/prometheus "$@"
