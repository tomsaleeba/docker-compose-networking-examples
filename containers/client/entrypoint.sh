#!/bin/sh
set -euo pipefail

targetHost=${TARGET_HOST:-stub_server}
targetPort=${TARGET_PORT:-5555}
echo "[INFO] running against server $targetHost:$targetPort"

apk add --no-cache curl

while :; do
  curl $targetHost:$targetPort/user || true # don't fail
  echo ''
  sleep 1
done
