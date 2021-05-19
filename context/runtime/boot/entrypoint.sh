#!/usr/bin/env bash
set -o errexit -o errtrace -o functrace -o nounset -o pipefail

HOMEKIT_NAME=${HOMEKIT_NAME:-}
HOMEKIT_MANUFACTURER=${HOMEKIT_MANUFACTURER:-}
HOMEKIT_SERIAL=${HOMEKIT_SERIAL:-}
HOMEKIT_MODEL=${HOMEKIT_MODEL:-}
HOMEKIT_VERSION=${HOMEKIT_VERSION:-}
HOMEKIT_PIN=${HOMEKIT_PIN:-}
PORT=${PORT:-10042}
IPS=${IPS:-}

# Ensure the data folder is writable
[ -w /data ] || {
  printf >&2 "/data is not writable. Check your mount permissions.\n"
  exit 1
}

args=()

[ ! "$HOMEKIT_NAME" ]           || args+=(--name          "$HOMEKIT_NAME")
[ ! "$HOMEKIT_MANUFACTURER" ]   || args+=(--manufacturer  "$HOMEKIT_MANUFACTURER")
[ ! "$HOMEKIT_SERIAL" ]         || args+=(--serial        "$HOMEKIT_SERIAL")
[ ! "$HOMEKIT_MODEL" ]          || args+=(--model         "$HOMEKIT_MODEL")
[ ! "$HOMEKIT_VERSION" ]        || args+=(--version       "$HOMEKIT_VERSION")
[ ! "$HOMEKIT_PIN" ]            || args+=(--pin           "$HOMEKIT_PIN")
[ ! "$PORT" ]                   || args+=(--port          "$PORT")
[ ! "$IPS" ]                   || {
  for i in ${IPS[*]}; do
    args+=(--ips          "$i")
  done
}

# Run once configured
exec wizhard register --data-path=/data/dubo-wiz "${args[@]}" "$@"
