#!/bin/bash

echo "Ficheros con permiso de escritura"
for var in *
do
    if test -w "$var"
    then
        echo "$var"
    fi
done

echo "Ficheros con permiso de lectura"
for var in *
do
    if test -r "$var"
    then
        echo "$var"
    fi
done

echo "Ficheros con permiso de ejecucion"
for var in *
do
    if test -x "$var"
    then
        echo "$var"
    fi
done