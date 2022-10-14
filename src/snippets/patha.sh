#!/bin/sh
# echo $0;

if [ ! -L "$0" ]; then
    PLUG_PATH="$(realpath "$(dirname "$0")/..")"
else
    if command -v readlink >/dev/null; then
        PLUG_PATH="$(realpath "$(dirname "$(readlink -f "$0")")/..")"
    else
        PLUG_PATH="/opt/plug"
    fi
fi

# echo "$(realpath "$PLUG_PATH")"
echo "$PLUG_PATH"