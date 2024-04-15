#!/bin/bash

VALOR=0
if [ $# -eq 1 ]; then
    VALOR=`expr $1 + 1`
    if [ $? -eq 0 ]; then
    
    echo "Es un numero"
    else
    echo "No es un numero"
    fi
    echo "Solo un parametro"
fi

echo "Fin del programa"