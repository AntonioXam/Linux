#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Se debe proporcionar un nombre de usuario como unico parametro"
elif [ "$1" != "`whoami`" ]; then
    echo "El nombre de usuario proporcionado ($1) no coincide con el usuario actual (`whoami`)";
else
    if who | grep -w "$1"; then
        echo "El usuario actual esta conectado"
    else
        echo "El usuario actual no esta conectado"
    fi
fi