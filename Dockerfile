FROM alpine:latest

EXPOSE 1812/udp
EXPOSE 1813/udp

RUN apk update && apk upgrade &&\
    apk add freeradius-eap freeradius-radclient dumb-init &&\
    cd /etc/raddb/mods-enabled &&\
    rm detail.log date echo linelog ntlm_auth passwd replicate soh sradutmp totp unpack

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD [ "/usr/sbin/radiusd", "-f" ]

