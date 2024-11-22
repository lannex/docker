FROM alpine:3.20

RUN apk update && \
    apk add --no-cache squid=6.9-r0 openssl bash iptables
 
WORKDIR /etc/squid/ssl_cert

RUN openssl req -new -newkey rsa:2048 -days 3650 -nodes -x509 \
      -keyout /etc/squid/ssl_cert/squid.pem \
      -out /etc/squid/ssl_cert/squid.pem \
      -subj "/C=XX/ST=XX/L=squid/O=squid/CN=squid"

WORKDIR /

RUN /usr/lib/squid/security_file_certgen -c -s /var/lib/ssl_db -M 4MB && \
  chown -R squid /var/lib/ssl_db

COPY squid.conf /etc/squid/squid.conf
COPY setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 3128 3129

VOLUME [/var/log/squid /var/spool/squid]

# ENTRYPOINT ["/bin/bash", "-c", "/setup.sh"]
# CMD ["-f" "/etc/squid/squid.conf" "-NYC"]

CMD ["/bin/bash", "-c", "/setup.sh && /usr/sbin/squid -N -d1"]
