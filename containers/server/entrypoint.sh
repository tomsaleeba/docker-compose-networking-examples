#!/bin/sh
set -euo pipefail

port=${PORT:-5555}

echo "[INFO] starting on port=$port"

while :; do
  date | nc -l -p $port
done

