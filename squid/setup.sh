#!/bin/bash

# re-create snakeoil self-signed certificate removed in the build process
if [ ! -f /etc/ssl/private/ssl-cert-snakeoil.key ]; then
    /usr/sbin/make-ssl-cert generate-default-snakeoil --force-overwrite > /dev/null 2>&1
fi

tail -F /var/log/squid/access.log 2>/dev/null &
tail -F /var/log/squid/error.log 2>/dev/null &
tail -F /var/log/squid/store.log 2>/dev/null &
tail -F /var/log/squid/cache.log 2>/dev/null &

# route
# iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3128
# iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 3129

# create missing cache directories and exit
/usr/sbin/squid -Nz
# /usr/sbin/squid "$@"
