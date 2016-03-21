# stunnel Server
#
# VERSION 0.0.1

# Building from Ubuntu Precise

FROM alpine:3.2

RUN echo "http://dl-3.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories \
&& apk add -U stunnel ca-certificates \
&& rm -rf /var/cache/apk/*

VOLUME ["/stunnel"]

ADD stunnel.conf /stunnel/stunnel.conf
ADD stunnel.pem /stunnel/stunnel.pem

# Build stunnel

EXPOSE 5002

CMD ["/usr/bin/stunnel", "/stunnel/stunnel.conf"]
