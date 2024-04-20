#!/bin/bash

if [ $# -eq 2 ]
then
   if [ -f "$1" -a -f "$2" ]
   then
     mv "$1" temp
     mv "$2" "$1"
     mv temp "$2"

   else
     echo "Uno de los dos archivos no es un archivo regular"
   fi
else
    echo "Numero de parametros incorrecto deben ser dos parametros"
fi

