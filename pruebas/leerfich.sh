#!/bin/bash

#crear script que lea un fichero y muestre la linea solicitada
#comprobar que sea un fichero y haya parametro

echo -n "Introduce el fichero: "
read fichero

if [ ! -f $fichero ]
then
    echo "$fichero no es un fichero"
    exit 2
fi

num=`cat $fichero | wc -l`

echo "Numero de lineas en el fichero $fichero: $num"

while :
do
    echo -n "Introduce una linea del fichero [1-$num] o 0 para salir: "
    read linea

    if [ $linea -eq 0 ]
    then
        echo "Fin del programa"
        exit 0
    fi

    if [ $linea -gt 0 -a $linea -le $num ]
    then
        echo "La linea $linea del fichero $fichero es:"
        sed -n "$linea p" $fichero
    else
        echo "La linea debe estar entre 1 y $num"
    fi
done


