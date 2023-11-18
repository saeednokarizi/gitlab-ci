#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
docker run -it --rm --name letsencrypt \
    -v "${DIR}/etc/letsencrypt:/etc/letsencrypt" \
    -v "${DIR}/var/lib/letsencrypt:/var/lib/letsencrypt" \
    certbot/certbot:latest \
        certonly \
        -d $1 \
        -d *.$1 \
        --manual \
        --preferred-challenges dns \
        --server https://acme-v02.api.letsencrypt.org/directory

