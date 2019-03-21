FROM alpine:3.9

ENV DEHYDRATED_VERSION=0.6.2 \
    CF_HOOK_VERSION=0.1

RUN apk update \
 && apk add bash curl openssl \
 && curl -L https://github.com/lukas2511/dehydrated/releases/download/v$DEHYDRATED_VERSION/dehydrated-$DEHYDRATED_VERSION.tar.gz \
 | tar -xz --strip-components=1 -C /usr/local/bin dehydrated-$DEHYDRATED_VERSION/dehydrated \
 && curl -L https://github.com/erikced/dehydrated-cloudflare-hook/releases/download/v$CF_HOOK_VERSION/dehydrated-cloudflare-hook-v$CF_HOOK_VERSION-linux-amd64.tar.gz \
 | tar -xz --strip-components=1 -C /usr/local/bin dehydrated-cloudflare-hook-v$CF_HOOK_VERSION/dehydrated-cloudflare-hook \
 && mkdir -p /certificates /config /var/www/dehydrated
ADD acme-updater.sh /usr/local/bin/
CMD ["/usr/local/bin/acme-updater.sh"]
