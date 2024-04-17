#!/bin/bash

VALOR=0
if [ $# -eq 1 ]; then
    expr $num \* 1 >/dev/null 2> /dev/null
    if [ $? -eq 0 ]; then
    
    echo "Es un numero"
    else
    echo "No es un numero"
    fi
    echo "Solo un parametro"
fi

echo "Fin del programa"