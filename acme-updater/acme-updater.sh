#!/usr/bin/env sh
[ -n "${ALGO}" ] || ALGO=prime256v1
[ -n "${CERTDIR}" ] || CERTDIR=/etc/certs
DEFAULT_CONFIG_PATH=/etc/dehydrated/config
[ -n "${CONFIG}" ] || CONFIG=$DEFAULT_CONFIG_PATH
[ -n "${ALIAS}" ] && ALIAS_OPT=--alias

if [ ! -f $CONFIG -a "$CONFIG" = "$DEFAULT_CONFIG_PATH" ]; then
    mkdir -p $(dirname "$DEFAULT_CONFIG_PATH")
    cat <<EOF > "$CONFIG"
HOOK_CHAIN="yes"
EOF
    if [ -n "$CONTACT_EMAIL" ]; then
        echo "CONTACT_EMAIL=\"$CONTACT_EMAIL\"" >> $CONFIG
    fi
fi

if [ -z "$DOMAIN" ]; then
    echo "\$DOMAIN is not set or empty."
    exit 1
fi


exec /usr/local/bin/dehydrated --cron --accept-terms --config "$CONFIG" \
    --hook /usr/local/bin/dehydrated-cloudflare-hook --out "$CERTDIR" \
    --challenge dns-01 --algo "$ALGO" --domain "$DOMAIN" $ALIAS_OPT $ALIAS
