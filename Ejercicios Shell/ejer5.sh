#!/bin/bash

if [ $# -eq 1 ] 
then
fichero=$1

    echo "El fichero $fichero existe y es regular"
if test -w $fichero
then
    echo "tiene persimos escritura"
fi
if test -r $fichero
then
    echo "tiene persimos lectura"
fi
if test -x $fichero
then
    echo "tiene persimos ejecucion"
fi

else 
    echo "Numero de parametros incorrecto..."
fi