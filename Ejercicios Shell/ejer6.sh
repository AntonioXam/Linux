#!/bin/bash

if [ $# -eq 2 ]; then
    echo "$1 y $2"
    
   if [ "$1" == "$2" ]; then
    echo "Las cadenas son iguales."
else
    echo "Las cadenas no son iguales."
fi
else
    echo "Numero de parametros incorrecto"
fi


