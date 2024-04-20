#!/usr/bin/env bash

if id -u "$1" >/dev/null 2>&1; then
    if who | grep -qw "$1"; then
        echo "El usuario $1 está conectado"
    else
        echo "El usuario $1 no está conectado"
    fi
else
    echo "El usuario $1 no existe"
fi
